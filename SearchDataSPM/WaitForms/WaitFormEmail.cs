﻿using System;
using System.Windows.Forms;

namespace SearchDataSPM.Engineering
{
    public partial class WaitFormEmail : MetroFramework.Forms.MetroForm
    {


        public WaitFormEmail()
        {
            InitializeComponent();

        }


        private void metroProgressSpinner1_Click(object sender, EventArgs e)
        {

        }

        private void WaitFormSaving_Load(object sender, EventArgs e)
        {
        }

        private void WaitFormSaving_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Dispose();
        }
    }
}