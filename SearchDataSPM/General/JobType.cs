﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SearchDataSPM
{
    public partial class JobType : Form
    {
        public JobType()
        {
            InitializeComponent();
        }

        public string ValueIWant { get; set; }


        private void metroTile2_Click(object sender, EventArgs e)
        {
            ValueIWant = "spare";
            this.DialogResult = System.Windows.Forms.DialogResult.OK;
            Close();
        }

        private void metroTile1_Click(object sender, EventArgs e)
        {
            ValueIWant = "project";
            this.DialogResult = System.Windows.Forms.DialogResult.OK;
            Close();
        }

        private void metroTile3_Click(object sender, EventArgs e)
        {
            ValueIWant = "service";
            this.DialogResult = System.Windows.Forms.DialogResult.OK;
            Close();
        }

        private void metroTile4_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void JobType_Load(object sender, EventArgs e)
        {
            label1.Focus();
        }
    }
}