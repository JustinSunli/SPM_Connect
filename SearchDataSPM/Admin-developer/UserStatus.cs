﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SearchDataSPM.Admin_developer
{
    public partial class UserStatus : Form
    {
       
        SqlConnection cn;
        String connection;

        public UserStatus()
        {
            InitializeComponent();

            connection = System.Configuration.ConfigurationManager.ConnectionStrings["SearchDataSPM.Properties.Settings.cn"].ConnectionString;
            try
            {
                cn = new SqlConnection(connection);

            }
            catch (Exception)
            {

                //MessageBox.Show(ex.Message, "SPM Connect", MessageBoxButtons.OK, MessageBoxIcon.Error);
                MessageBox.Show("Error Connecting to SQL Server.....", "SPM Connect - ENG", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.Exit();
                //Environment.Exit(0);

            }

        }

        private void UserStatus_Load(object sender, EventArgs e)
        {
            Checkdeveloper();
            loaddata();
        }


        private void loaddata()
        {
            System.IO.StreamReader file = new System.IO.StreamReader(@"\\spm-adfs\SDBASE\SPM_Connect_User_Logs\chekin.txt");
            string[] columnnames = (@"Login, Apllication Running, User").Split(',');
            DataTable dt = new DataTable();
            foreach (string c in columnnames)
            {
                dt.Columns.Add(c);
            }
            string newline;
            while ((newline = file.ReadLine()) != null)
            {
                DataRow dr = dt.NewRow();
                string[] values = newline.Split(',');
                for (int i = 0; i < values.Length; i++)
                {
                    dr[i] = values[i];
                }
                dt.Rows.Add(dr);
            }
            file.Close();
            dataGridView1.DataSource = dt;
            dataGridView1.Columns[0].Width = 160;
            dataGridView1.Columns[1].Width = 200;
            dataGridView1.Columns[2].Width = 150;
            UpdateFont();
        }

        private void UpdateFont()
        {
            dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Tahoma", 9.0F, FontStyle.Bold);
            dataGridView1.DefaultCellStyle.Font = new Font("Arial", 9.5F, FontStyle.Bold);
            dataGridView1.DefaultCellStyle.ForeColor = Color.Black;
            dataGridView1.DefaultCellStyle.BackColor = Color.FromArgb(237, 237, 237);
            dataGridView1.DefaultCellStyle.SelectionForeColor = Color.Yellow;
            dataGridView1.DefaultCellStyle.SelectionBackColor = Color.Black;
        }


        private void Checkdeveloper()
        {
            string useradmin = System.Security.Principal.WindowsIdentity.GetCurrent().Name;

            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) FROM [SPM_Database].[dbo].[Users] WHERE UserName = @username AND Developer = '1'", cn))
            {
                try
                {
                    cn.Open();
                    sqlCommand.Parameters.AddWithValue("@username", useradmin);

                    int userCount = (int)sqlCommand.ExecuteScalar();
                    if (userCount == 1)
                    {
                        dataGridView1.ContextMenuStrip = Listviewcontextmenu;
                        Listviewcontextmenu.Enabled = true;
                        Listviewcontextmenu.Visible = true;
                    
                    }
                    else
                    {
                        dataGridView1.ContextMenuStrip = null;
                        Listviewcontextmenu.Enabled = false;
                        Listviewcontextmenu.Visible = false;

                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "SPM Connect", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Application.Exit();
                }
                finally
                {
                    cn.Close();
                }

            }

        }

        private void freeuser_Click(object sender, EventArgs e)
        {

            string userName = getuserselected().Trim();
            string LinesToDelete = userName;
            var Lines = File.ReadAllLines(@"\\spm-adfs\SDBASE\SPM_Connect_User_Logs\chekin.txt");
            var newLines = Lines.Where(line => !line.Contains(LinesToDelete));
            File.WriteAllLines(@"\\spm-adfs\SDBASE\SPM_Connect_User_Logs\chekin.txt", newLines);
            //dataGridView1.Rows.Clear();
            //dataGridView1.Refresh();
            //loaddata();
            
        }

        private String getuserselected()
        {
            int selectedclmindex = dataGridView1.SelectedCells[0].ColumnIndex;
            DataGridViewColumn columnchk = dataGridView1.Columns[selectedclmindex];
            string c = Convert.ToString(columnchk.Index);
            //MessageBox.Show(c);
            string item;
            if (dataGridView1.SelectedRows.Count == 1 || dataGridView1.SelectedCells.Count == 1)
            {
                int selectedrowindex = dataGridView1.SelectedCells[0].RowIndex;
                DataGridViewRow slectedrow = dataGridView1.Rows[selectedrowindex];
                item = Convert.ToString(slectedrow.Cells[2].Value);
                //MessageBox.Show(ItemNo);
                return item;
            }
            else
            {
                item = "";
                return item;
            }
        }

        private void dataGridView1_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.RowIndex == -1) return;

            DataGridViewRow row = dataGridView1.Rows[e.RowIndex];

            if (e.Button == MouseButtons.Right)
            {

                int columnindex = e.RowIndex;
                dataGridView1.ClearSelection();
                dataGridView1.Rows[columnindex].Selected = true;

            }

        }
    }
}