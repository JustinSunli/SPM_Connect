﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Windows.Forms;

namespace SearchDataSPM
{
    public partial class ConnectParameters : Form
    {
        private BindingSource bindingSource1 = new BindingSource();
        private SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private log4net.ILog log;

        private ErrorHandler errorHandler = new ErrorHandler();

        public ConnectParameters()
        {
            InitializeComponent();
        }

        private void savebttn_Click(object sender, EventArgs e)
        {
            bindingSource1.EndEdit();
            dataAdapter.Update((DataTable)bindingSource1.DataSource);
            GetData();
            MessageBox.Show("You have successfully saved changes.", "SPM Connect", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void ConnectParameters_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bindingSource1;
            GetData();
            log4net.Config.XmlConfigurator.Configure();
            log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            log.Info("Opened Connect Parameters by " + System.Environment.UserName);
        }

        private void GetData()
        {
            try
            {
                // Populate a new data table and bind it to the BindingSource.
                string connection = System.Configuration.ConfigurationManager.ConnectionStrings["SearchDataSPM.Properties.Settings.cn"].ConnectionString;
                dataAdapter = new SqlDataAdapter("SELECT * FROM [SPM_Database].[dbo].[ConnectParamaters] ORDER BY Id", connection);

                // Create a command builder to generate SQL update, insert, and
                // delete commands based on selectCommand.
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

                // Populate a new data table and bind it to the BindingSource.
                DataTable table = new DataTable
                {
                    Locale = CultureInfo.InvariantCulture
                };
                dataAdapter.Fill(table);
                bindingSource1.DataSource = table;

                // Resize the DataGridView columns to fit the newly loaded content.
                dataGridView1.AutoResizeColumns(
                    DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
                dataGridView1.Columns[0].ReadOnly = true;
                dataGridView1.Columns[1].ReadOnly = true;
            }
            catch (SqlException)
            {
                MessageBox.Show("To run this example, replace the value of the " +
                    "connectionString variable with a connection string that is " +
                    "valid for your system.");
            }
        }

        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete)
            {
                if (MessageBox.Show("Are you sure want to delete this record?", "Delete Parameter", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    bindingSource1.RemoveCurrent();
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1)
            {
                if (dataGridView1.Rows[e.RowIndex].IsNewRow)
                {
                    dataGridView1.Columns[1].ReadOnly = false;
                    dataGridView1.BeginEdit(true);
                }
                else
                {
                    dataGridView1.Columns[1].ReadOnly = true;
                    dataGridView1.BeginEdit(true);
                    if (dataGridView1.CurrentCell.ColumnIndex.Equals(1) && e.RowIndex != -1)
                        MessageBox.Show("Not allowed to edit parameters name as they are being used by the program.", "SPM Connect - Allow Edit", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void ConnectParameters_FormClosed(object sender, FormClosedEventArgs e)
        {
            log.Info("Closed Connect Parameters by " + System.Environment.UserName);
            this.Dispose();
        }
    }
}