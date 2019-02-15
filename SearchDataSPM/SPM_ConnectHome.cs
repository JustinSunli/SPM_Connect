﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace SearchDataSPM
{
    public partial class SPM_ConnectHome : Form
    {
        public SPM_ConnectHome()
        {
            InitializeComponent();          
        }

        int time = 0;

        private void timer1_Tick(object sender, EventArgs e)
        {
            time = time + 10;
            rectangleShape2.Width += 11;

            if(time == 240)
            {
               Connect_SPMSQL();
            }
           
            if (time >= 250)
            {
                timer1.Stop();
                this.Hide();


            }
        }

        private void SPM_ConnectHome_Load(object sender, EventArgs e)
        {
            
            timer1.Start();
        }

        String connection;
        SqlConnection cn;
        string userName;

        public void Connect_SPMSQL()
        {
            
            connection = System.Configuration.ConfigurationManager.ConnectionStrings["SearchDataSPM.Properties.Settings.cn"].ConnectionString;
            userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            try
            {
                cn = new SqlConnection(connection);
                cn.Open();

            }
            catch (Exception)
            {

                MessageBox.Show("Cannot connect through the server. Please check the network connection.", "SPM Connect Home - SQL Server Connection Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.ExitThread();
                System.Environment.Exit(0);



            }
            finally
            {
                cn.Close();
                if (!checkmaintenance())
                {
                    checkforuser();
                }
                else
                {
                    MetroFramework.MetroMessageBox.Show(this, "SPM Connect is under maintenance. Cannot start the application. Sorry for the inconvenience.", "System Under Maintenance", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Application.ExitThread();
                    System.Environment.Exit(0);
                }
               
            }

            
        }

        public void checkforuser()
        {
           
            if (chekusercredentialscontrols())
            {

                // this.Hide();
                var form2 = new SPM_ConnectControls();
                form2.Closed += (s, args) => this.Close();
                form2.Show();
                //Application.Run(new SPM_ConnectControls());
            }
           
            else if (chekusercredentialseng())
            {

                var form2 = new SPM_Connect();
                form2.Closed += (s, args) => this.Close();
                form2.Show();
                //Application.Run(new SPM_Connect());
            }
            else if (chekusercredentialsproduction())
            {
                // this.Hide();
                var form2 = new SPM_ConnectProduction();
                form2.Closed += (s, args) => this.Close();
                form2.Show();
                //Application.Run(new SPM_ConnectProduction());
            }
            else
            {
               
                MessageBox.Show("UserName " + userName + " is not a licensed user. Please contact the admin.", "SPM Connect", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.ExitThread();
                System.Environment.Exit(0);
            }
        }

        public bool chekusercredentialscontrols()
        {
          
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) FROM [SPM_Database].[dbo].[USers] WHERE UserName = @username AND Department = 'Controls'", cn))
            {
                cn.Open();
                sqlCommand.Parameters.AddWithValue("@username", userName);

                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount == 1)
                {
                    cn.Close();

                    return true;
                }
                else
                {
                    cn.Close();


                }
            }
            return false;
        }

        public bool chekusercredentialseng()
        {
          
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) FROM [SPM_Database].[dbo].[USers] WHERE UserName = @username AND Department = 'Eng'", cn))
            {
                cn.Open();

                sqlCommand.Parameters.AddWithValue("@username", userName);

                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount == 1)
                {
                    cn.Close();

                    return true;
                }
                else
                {
                    cn.Close();


                }
            }
            return false;
        }

        public bool chekusercredentialsproduction()
        {
            
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) FROM [SPM_Database].[dbo].[USers] WHERE UserName = @username AND Department = 'Production'", cn))
            {
                cn.Open();
                sqlCommand.Parameters.AddWithValue("@username", userName);

                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount == 1)
                {
                    cn.Close();
                    return true;



                }
                else
                {
                    cn.Close();

                }

            }
            return false;
        }

        private bool checkmaintenance()
        {
            bool maintenance = false;
            string limit = "";
            using (SqlCommand cmd = new SqlCommand("SELECT ParameterValue FROM [SPM_Database].[dbo].[ConnectParamaters] WHERE Parameter = 'Maintenance'", cn))
            {
                try
                {
                    if (cn.State == ConnectionState.Closed)
                        cn.Open();
                    limit = (string)cmd.ExecuteScalar();
                    cn.Close();
                }
                catch (Exception ex)
                {
                    MetroFramework.MetroMessageBox.Show(this, ex.Message, "SPM Connect Error connecting to server", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    cn.Close();
                }

            }
            if (limit == "1")
            {
                maintenance = true;
            }
            return maintenance;

        }

        private void metroProgressSpinner1_Click(object sender, EventArgs e)
        {

        }

        private void SPM_Click(object sender, EventArgs e)
        {

        }
    }
}
