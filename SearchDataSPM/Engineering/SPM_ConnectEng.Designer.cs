﻿using System;

namespace SearchDataSPM
{
	partial class SPM_Connect
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SPM_Connect));
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.itemNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.descriptionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.familyCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufacturerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufacturerItemNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FormSelector = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.inventoryBindingSource3 = new System.Windows.Forms.BindingSource(this.components);
            this.sPM_DatabaseDataSet = new SearchDataSPM.SPM_DatabaseDataSet();
            this.Reload = new System.Windows.Forms.Button();
            this.Descrip_txtbox = new System.Windows.Forms.TextBox();
            this.filteroem_txtbox = new System.Windows.Forms.TextBox();
            this.filteroemitem_txtbox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.filter4 = new System.Windows.Forms.TextBox();
            this.TreeViewToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.imageList = new System.Windows.Forms.ImageList(this.components);
            this.listView = new System.Windows.Forms.ListView();
            this.Listviewcontextmenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            this.recordlabel = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.SPM = new System.Windows.Forms.Label();
            this.AddNewBttn = new System.Windows.Forms.Button();
            this.jobsbttn = new System.Windows.Forms.Button();
            this.bomlistviewmenustrpc = new System.Windows.Forms.ToolStripMenuItem();
            this.whereusedlistviewStripMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.iteminfolistviewStripMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.admin_bttn = new System.Windows.Forms.Button();
            this.bOMToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whereUsedToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openModelToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openDrawingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editItemToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.copySelectedItemToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewReportBOM = new System.Windows.Forms.ToolStripMenuItem();
            this.billsOfMaunfacturingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sparePartsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteItemToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.FormSelector.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.inventoryBindingSource3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sPM_DatabaseDataSet)).BeginInit();
            this.Listviewcontextmenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtSearch
            // 
            this.txtSearch.AccessibleName = "";
            this.txtSearch.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtSearch.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(210, 15);
            this.txtSearch.MaximumSize = new System.Drawing.Size(32767, 25);
            this.txtSearch.MinimumSize = new System.Drawing.Size(4, 23);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(557, 26);
            this.txtSearch.TabIndex = 0;
            this.TreeViewToolTip.SetToolTip(this.txtSearch, "Enter Search Keyword.\r\n");
            this.txtSearch.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtSearch_KeyDown);
            // 
            // dataGridView
            // 
            this.dataGridView.AllowUserToAddRows = false;
            this.dataGridView.AllowUserToDeleteRows = false;
            this.dataGridView.AllowUserToOrderColumns = true;
            this.dataGridView.AllowUserToResizeRows = false;
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.AutoGenerateColumns = false;
            this.dataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.dataGridView.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dataGridView.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.itemNumberDataGridViewTextBoxColumn,
            this.descriptionDataGridViewTextBoxColumn,
            this.familyCodeDataGridViewTextBoxColumn,
            this.manufacturerDataGridViewTextBoxColumn,
            this.manufacturerItemNumberDataGridViewTextBoxColumn});
            this.dataGridView.ContextMenuStrip = this.FormSelector;
            this.dataGridView.DataSource = this.inventoryBindingSource3;
            this.dataGridView.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dataGridView.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(237)))), ((int)(((byte)(237)))), ((int)(((byte)(237)))));
            this.dataGridView.Location = new System.Drawing.Point(2, 100);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RowHeadersVisible = false;
            this.dataGridView.Size = new System.Drawing.Size(980, 465);
            this.dataGridView.TabIndex = 6;
            this.dataGridView.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellDoubleClick);
            this.dataGridView.CellMouseDown += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView_CellMouseDown);
            this.dataGridView.CellMouseLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellMouseLeave);
            this.dataGridView.CellMouseMove += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView_CellMouseMove);
            this.dataGridView.CellPainting += new System.Windows.Forms.DataGridViewCellPaintingEventHandler(this.dataGridView_CellPainting_1);
            this.dataGridView.SelectionChanged += new System.EventHandler(this.dataGridView_SelectionChanged);
            this.dataGridView.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataGridView_KeyDown);
            // 
            // itemNumberDataGridViewTextBoxColumn
            // 
            this.itemNumberDataGridViewTextBoxColumn.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.itemNumberDataGridViewTextBoxColumn.DataPropertyName = "ItemNumber";
            this.itemNumberDataGridViewTextBoxColumn.FillWeight = 152.2843F;
            this.itemNumberDataGridViewTextBoxColumn.HeaderText = "Item No.";
            this.itemNumberDataGridViewTextBoxColumn.MinimumWidth = 85;
            this.itemNumberDataGridViewTextBoxColumn.Name = "itemNumberDataGridViewTextBoxColumn";
            this.itemNumberDataGridViewTextBoxColumn.ReadOnly = true;
            this.itemNumberDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.itemNumberDataGridViewTextBoxColumn.Width = 85;
            // 
            // descriptionDataGridViewTextBoxColumn
            // 
            this.descriptionDataGridViewTextBoxColumn.DataPropertyName = "Description";
            dataGridViewCellStyle1.NullValue = null;
            this.descriptionDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle1;
            this.descriptionDataGridViewTextBoxColumn.FillWeight = 86.92893F;
            this.descriptionDataGridViewTextBoxColumn.HeaderText = "Description";
            this.descriptionDataGridViewTextBoxColumn.Name = "descriptionDataGridViewTextBoxColumn";
            this.descriptionDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // familyCodeDataGridViewTextBoxColumn
            // 
            this.familyCodeDataGridViewTextBoxColumn.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.familyCodeDataGridViewTextBoxColumn.DataPropertyName = "FamilyCode";
            this.familyCodeDataGridViewTextBoxColumn.FillWeight = 86.92893F;
            this.familyCodeDataGridViewTextBoxColumn.HeaderText = "Family Code";
            this.familyCodeDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.familyCodeDataGridViewTextBoxColumn.Name = "familyCodeDataGridViewTextBoxColumn";
            this.familyCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.familyCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.familyCodeDataGridViewTextBoxColumn.Width = 50;
            // 
            // manufacturerDataGridViewTextBoxColumn
            // 
            this.manufacturerDataGridViewTextBoxColumn.DataPropertyName = "Manufacturer";
            dataGridViewCellStyle2.NullValue = null;
            this.manufacturerDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle2;
            this.manufacturerDataGridViewTextBoxColumn.FillWeight = 86.92893F;
            this.manufacturerDataGridViewTextBoxColumn.HeaderText = "Manufacturer";
            this.manufacturerDataGridViewTextBoxColumn.Name = "manufacturerDataGridViewTextBoxColumn";
            this.manufacturerDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // manufacturerItemNumberDataGridViewTextBoxColumn
            // 
            this.manufacturerItemNumberDataGridViewTextBoxColumn.DataPropertyName = "ManufacturerItemNumber";
            dataGridViewCellStyle3.NullValue = null;
            this.manufacturerItemNumberDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle3;
            this.manufacturerItemNumberDataGridViewTextBoxColumn.FillWeight = 86.92893F;
            this.manufacturerItemNumberDataGridViewTextBoxColumn.HeaderText = "Manufacturer Item Number";
            this.manufacturerItemNumberDataGridViewTextBoxColumn.Name = "manufacturerItemNumberDataGridViewTextBoxColumn";
            this.manufacturerItemNumberDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // FormSelector
            // 
            this.FormSelector.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bOMToolStripMenuItem,
            this.whereUsedToolStripMenuItem,
            this.openModelToolStripMenuItem,
            this.openDrawingToolStripMenuItem,
            this.editItemToolStripMenuItem,
            this.copySelectedItemToolStripMenuItem,
            this.viewReportBOM,
            this.deleteItemToolStripMenuItem});
            this.FormSelector.Name = "contextMenuStrip1";
            this.FormSelector.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.FormSelector.Size = new System.Drawing.Size(177, 180);
            // 
            // inventoryBindingSource3
            // 
            this.inventoryBindingSource3.DataMember = "Inventory";
            this.inventoryBindingSource3.DataSource = this.sPM_DatabaseDataSet;
            // 
            // sPM_DatabaseDataSet
            // 
            this.sPM_DatabaseDataSet.DataSetName = "SPM_DatabaseDataSet";
            this.sPM_DatabaseDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // Reload
            // 
            this.Reload.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Reload.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.Reload.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Reload.Location = new System.Drawing.Point(773, 13);
            this.Reload.MaximumSize = new System.Drawing.Size(140, 30);
            this.Reload.MinimumSize = new System.Drawing.Size(140, 30);
            this.Reload.Name = "Reload";
            this.Reload.Size = new System.Drawing.Size(140, 30);
            this.Reload.TabIndex = 8;
            this.Reload.Text = "Refresh / Show All";
            this.TreeViewToolTip.SetToolTip(this.Reload, "Click To Reset\r\nOr\r\nPress Home Button");
            this.Reload.UseVisualStyleBackColor = true;
            this.Reload.Click += new System.EventHandler(this.Reload_Click);
            // 
            // Descrip_txtbox
            // 
            this.Descrip_txtbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Descrip_txtbox.BackColor = System.Drawing.SystemColors.MenuBar;
            this.Descrip_txtbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Descrip_txtbox.Location = new System.Drawing.Point(210, 54);
            this.Descrip_txtbox.MaximumSize = new System.Drawing.Size(180, 26);
            this.Descrip_txtbox.MinimumSize = new System.Drawing.Size(180, 26);
            this.Descrip_txtbox.Name = "Descrip_txtbox";
            this.Descrip_txtbox.Size = new System.Drawing.Size(180, 26);
            this.Descrip_txtbox.TabIndex = 2;
            this.TreeViewToolTip.SetToolTip(this.Descrip_txtbox, "Enter Keyword 2");
            this.Descrip_txtbox.Visible = false;
            this.Descrip_txtbox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Descrip_txtbox_KeyDown);
            // 
            // filteroem_txtbox
            // 
            this.filteroem_txtbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filteroem_txtbox.BackColor = System.Drawing.SystemColors.MenuBar;
            this.filteroem_txtbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.filteroem_txtbox.Location = new System.Drawing.Point(396, 54);
            this.filteroem_txtbox.MaximumSize = new System.Drawing.Size(180, 26);
            this.filteroem_txtbox.MinimumSize = new System.Drawing.Size(180, 26);
            this.filteroem_txtbox.Name = "filteroem_txtbox";
            this.filteroem_txtbox.Size = new System.Drawing.Size(180, 26);
            this.filteroem_txtbox.TabIndex = 3;
            this.TreeViewToolTip.SetToolTip(this.filteroem_txtbox, "Enter Keyword 3");
            this.filteroem_txtbox.Visible = false;
            this.filteroem_txtbox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.filteroem_txtbox_KeyDown);
            // 
            // filteroemitem_txtbox
            // 
            this.filteroemitem_txtbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filteroemitem_txtbox.BackColor = System.Drawing.SystemColors.MenuBar;
            this.filteroemitem_txtbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.filteroemitem_txtbox.Location = new System.Drawing.Point(582, 54);
            this.filteroemitem_txtbox.MaximumSize = new System.Drawing.Size(180, 26);
            this.filteroemitem_txtbox.MinimumSize = new System.Drawing.Size(120, 25);
            this.filteroemitem_txtbox.Name = "filteroemitem_txtbox";
            this.filteroemitem_txtbox.Size = new System.Drawing.Size(180, 26);
            this.filteroemitem_txtbox.TabIndex = 4;
            this.TreeViewToolTip.SetToolTip(this.filteroemitem_txtbox, "Enter keyworkd 4");
            this.filteroemitem_txtbox.Visible = false;
            this.filteroemitem_txtbox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.filteroemitem_txtbox_KeyDown);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 6F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(958, 2);
            this.label1.MaximumSize = new System.Drawing.Size(26, 8);
            this.label1.MinimumSize = new System.Drawing.Size(26, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 8);
            this.label1.TabIndex = 11;
            this.label1.Text = "V7.0.0";
            this.TreeViewToolTip.SetToolTip(this.label1, "SPM Connect V7.0.0");
            this.label1.DoubleClick += new System.EventHandler(this.label1_DoubleClick);
            // 
            // filter4
            // 
            this.filter4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filter4.BackColor = System.Drawing.SystemColors.MenuBar;
            this.filter4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.filter4.Location = new System.Drawing.Point(768, 54);
            this.filter4.MaximumSize = new System.Drawing.Size(180, 26);
            this.filter4.MinimumSize = new System.Drawing.Size(120, 25);
            this.filter4.Name = "filter4";
            this.filter4.Size = new System.Drawing.Size(180, 26);
            this.filter4.TabIndex = 5;
            this.TreeViewToolTip.SetToolTip(this.filter4, "Enter Keyword 5");
            this.filter4.Visible = false;
            this.filter4.KeyDown += new System.Windows.Forms.KeyEventHandler(this.filter4_KeyDown);
            // 
            // TreeViewToolTip
            // 
            this.TreeViewToolTip.AutoPopDelay = 4000;
            this.TreeViewToolTip.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.TreeViewToolTip.InitialDelay = 500;
            this.TreeViewToolTip.ReshowDelay = 100;
            // 
            // imageList
            // 
            this.imageList.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit;
            this.imageList.ImageSize = new System.Drawing.Size(256, 192);
            this.imageList.TransparentColor = System.Drawing.Color.Black;
            // 
            // listView
            // 
            this.listView.Activation = System.Windows.Forms.ItemActivation.OneClick;
            this.listView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.listView.BackColor = System.Drawing.Color.White;
            this.listView.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.listView.ContextMenuStrip = this.Listviewcontextmenu;
            this.listView.LargeImageList = this.imageList;
            this.listView.Location = new System.Drawing.Point(2, 568);
            this.listView.Margin = new System.Windows.Forms.Padding(3, 0, 3, 3);
            this.listView.MultiSelect = false;
            this.listView.Name = "listView";
            this.listView.ShowItemToolTips = true;
            this.listView.Size = new System.Drawing.Size(980, 220);
            this.listView.TabIndex = 7;
            this.listView.UseCompatibleStateImageBehavior = false;
            this.listView.ItemDrag += new System.Windows.Forms.ItemDragEventHandler(this.listView_ItemDrag);
            this.listView.ItemSelectionChanged += new System.Windows.Forms.ListViewItemSelectionChangedEventHandler(this.listView_ItemSelectionChanged);
            this.listView.SelectedIndexChanged += new System.EventHandler(this.listView_SelectedIndexChanged);
            this.listView.Enter += new System.EventHandler(this.listView_Enter);
            this.listView.KeyDown += new System.Windows.Forms.KeyEventHandler(this.listView_KeyDown);
            this.listView.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.listView_MouseDoubleClick);
            // 
            // Listviewcontextmenu
            // 
            this.Listviewcontextmenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bomlistviewmenustrpc,
            this.whereusedlistviewStripMenu,
            this.iteminfolistviewStripMenu,
            this.toolStripMenuItem1,
            this.toolStripMenuItem2});
            this.Listviewcontextmenu.Name = "contextMenuStrip1";
            this.Listviewcontextmenu.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.Listviewcontextmenu.Size = new System.Drawing.Size(177, 114);
            this.Listviewcontextmenu.Opening += new System.ComponentModel.CancelEventHandler(this.Listviewcontextmenu_Opening);
            // 
            // timer2
            // 
            this.timer2.Interval = 3000;
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // recordlabel
            // 
            this.recordlabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.recordlabel.AutoSize = true;
            this.recordlabel.Font = new System.Drawing.Font("Maiandra GD", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.recordlabel.ForeColor = System.Drawing.Color.White;
            this.recordlabel.Location = new System.Drawing.Point(840, 85);
            this.recordlabel.Name = "recordlabel";
            this.recordlabel.Size = new System.Drawing.Size(0, 14);
            this.recordlabel.TabIndex = 101;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.pictureBox1.ErrorImage = global::SearchDataSPM.Properties.Resources.spm_white_icon;
            this.pictureBox1.Image = global::SearchDataSPM.Properties.Resources.spmchristmas;
            this.pictureBox1.InitialImage = global::SearchDataSPM.Properties.Resources.spmchristmas;
            this.pictureBox1.Location = new System.Drawing.Point(2, 9);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(198, 85);
            this.pictureBox1.TabIndex = 102;
            this.pictureBox1.TabStop = false;
            this.TreeViewToolTip.SetToolTip(this.pictureBox1, "SPM Automation Inc.");
            this.pictureBox1.DoubleClick += new System.EventHandler(this.pictureBox1_DoubleClick);
            // 
            // SPM
            // 
            this.SPM.BackColor = System.Drawing.Color.Transparent;
            this.SPM.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SPM.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.SPM.Image = ((System.Drawing.Image)(resources.GetObject("SPM.Image")));
            this.SPM.Location = new System.Drawing.Point(2, 9);
            this.SPM.Name = "SPM";
            this.SPM.Size = new System.Drawing.Size(198, 85);
            this.SPM.TabIndex = 10;
            this.SPM.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.TreeViewToolTip.SetToolTip(this.SPM, "SPM Automation Inc.");
            this.SPM.DoubleClick += new System.EventHandler(this.SPM_DoubleClick);
            // 
            // AddNewBttn
            // 
            this.AddNewBttn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.AddNewBttn.BackColor = System.Drawing.Color.Transparent;
            this.AddNewBttn.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.AddNewBttn.FlatAppearance.BorderSize = 0;
            this.AddNewBttn.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.AddNewBttn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.AddNewBttn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.AddNewBttn.ForeColor = System.Drawing.Color.Transparent;
            this.AddNewBttn.Image = ((System.Drawing.Image)(resources.GetObject("AddNewBttn.Image")));
            this.AddNewBttn.Location = new System.Drawing.Point(918, 16);
            this.AddNewBttn.MaximumSize = new System.Drawing.Size(25, 25);
            this.AddNewBttn.MinimumSize = new System.Drawing.Size(25, 25);
            this.AddNewBttn.Name = "AddNewBttn";
            this.AddNewBttn.Size = new System.Drawing.Size(25, 25);
            this.AddNewBttn.TabIndex = 13;
            this.AddNewBttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.AddNewBttn, "Create New Item");
            this.AddNewBttn.UseVisualStyleBackColor = false;
            this.AddNewBttn.Click += new System.EventHandler(this.AddNewBttn_Click);
            // 
            // jobsbttn
            // 
            this.jobsbttn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.jobsbttn.BackColor = System.Drawing.Color.Transparent;
            this.jobsbttn.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.jobsbttn.FlatAppearance.BorderSize = 0;
            this.jobsbttn.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.jobsbttn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.jobsbttn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.jobsbttn.ForeColor = System.Drawing.Color.Transparent;
            this.jobsbttn.Image = ((System.Drawing.Image)(resources.GetObject("jobsbttn.Image")));
            this.jobsbttn.Location = new System.Drawing.Point(949, 16);
            this.jobsbttn.MaximumSize = new System.Drawing.Size(25, 25);
            this.jobsbttn.MinimumSize = new System.Drawing.Size(25, 25);
            this.jobsbttn.Name = "jobsbttn";
            this.jobsbttn.Size = new System.Drawing.Size(25, 25);
            this.jobsbttn.TabIndex = 11;
            this.jobsbttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.jobsbttn, "SPM Job Numbers\r\nCTRL + J");
            this.jobsbttn.UseVisualStyleBackColor = false;
            this.jobsbttn.Click += new System.EventHandler(this.jobsbttn_Click);
            // 
            // bomlistviewmenustrpc
            // 
            this.bomlistviewmenustrpc.Image = ((System.Drawing.Image)(resources.GetObject("bomlistviewmenustrpc.Image")));
            this.bomlistviewmenustrpc.Name = "bomlistviewmenustrpc";
            this.bomlistviewmenustrpc.Size = new System.Drawing.Size(176, 22);
            this.bomlistviewmenustrpc.Text = "BOM";
            this.bomlistviewmenustrpc.ToolTipText = "Bills Of Material";
            this.bomlistviewmenustrpc.Click += new System.EventHandler(this.bomlistviewmenustrpc_Click);
            // 
            // whereusedlistviewStripMenu
            // 
            this.whereusedlistviewStripMenu.Image = ((System.Drawing.Image)(resources.GetObject("whereusedlistviewStripMenu.Image")));
            this.whereusedlistviewStripMenu.Name = "whereusedlistviewStripMenu";
            this.whereusedlistviewStripMenu.Size = new System.Drawing.Size(176, 22);
            this.whereusedlistviewStripMenu.Text = "Where Used";
            this.whereusedlistviewStripMenu.ToolTipText = "Check Where Used";
            this.whereusedlistviewStripMenu.Click += new System.EventHandler(this.whereusedlistviewStripMenu_Click);
            // 
            // iteminfolistviewStripMenu
            // 
            this.iteminfolistviewStripMenu.Image = ((System.Drawing.Image)(resources.GetObject("iteminfolistviewStripMenu.Image")));
            this.iteminfolistviewStripMenu.Name = "iteminfolistviewStripMenu";
            this.iteminfolistviewStripMenu.Size = new System.Drawing.Size(176, 22);
            this.iteminfolistviewStripMenu.Text = "Get Item Info";
            this.iteminfolistviewStripMenu.ToolTipText = "Get Selected Item\'s Info.";
            this.iteminfolistviewStripMenu.Click += new System.EventHandler(this.iteminfolistviewStripMenu_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripMenuItem1.Image")));
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(176, 22);
            this.toolStripMenuItem1.Text = "Edit Item";
            this.toolStripMenuItem1.ToolTipText = "Edit Selected Item\'s Properties";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Image = ((System.Drawing.Image)(resources.GetObject("toolStripMenuItem2.Image")));
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(176, 22);
            this.toolStripMenuItem2.Text = "Copy Selected Item";
            this.toolStripMenuItem2.ToolTipText = "Copy selected item to new item number";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // admin_bttn
            // 
            this.admin_bttn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.admin_bttn.BackColor = System.Drawing.Color.Transparent;
            this.admin_bttn.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.admin_bttn.FlatAppearance.BorderSize = 0;
            this.admin_bttn.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.admin_bttn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.admin_bttn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.admin_bttn.ForeColor = System.Drawing.Color.Transparent;
            this.admin_bttn.Image = ((System.Drawing.Image)(resources.GetObject("admin_bttn.Image")));
            this.admin_bttn.Location = new System.Drawing.Point(944, 48);
            this.admin_bttn.MaximumSize = new System.Drawing.Size(35, 35);
            this.admin_bttn.MinimumSize = new System.Drawing.Size(35, 35);
            this.admin_bttn.Name = "admin_bttn";
            this.admin_bttn.Size = new System.Drawing.Size(35, 35);
            this.admin_bttn.TabIndex = 18;
            this.admin_bttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.admin_bttn, "Adminstrative Control");
            this.admin_bttn.UseVisualStyleBackColor = false;
            this.admin_bttn.Click += new System.EventHandler(this.admin_bttn_Click);
            // 
            // bOMToolStripMenuItem
            // 
            this.bOMToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("bOMToolStripMenuItem.Image")));
            this.bOMToolStripMenuItem.Name = "bOMToolStripMenuItem";
            this.bOMToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.bOMToolStripMenuItem.Text = "BOM";
            this.bOMToolStripMenuItem.ToolTipText = "Bills Of Material";
            this.bOMToolStripMenuItem.Click += new System.EventHandler(this.bOMToolStripMenuItem_Click);
            // 
            // whereUsedToolStripMenuItem
            // 
            this.whereUsedToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("whereUsedToolStripMenuItem.Image")));
            this.whereUsedToolStripMenuItem.Name = "whereUsedToolStripMenuItem";
            this.whereUsedToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.whereUsedToolStripMenuItem.Text = "Where Used";
            this.whereUsedToolStripMenuItem.ToolTipText = "Check Where Used";
            this.whereUsedToolStripMenuItem.Click += new System.EventHandler(this.whereUsedToolStripMenuItem_Click);
            // 
            // openModelToolStripMenuItem
            // 
            this.openModelToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("openModelToolStripMenuItem.Image")));
            this.openModelToolStripMenuItem.Name = "openModelToolStripMenuItem";
            this.openModelToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.openModelToolStripMenuItem.Text = "Open Model";
            this.openModelToolStripMenuItem.ToolTipText = "Open Selected Item\'s Model";
            this.openModelToolStripMenuItem.Click += new System.EventHandler(this.openModelToolStripMenuItem_Click);
            // 
            // openDrawingToolStripMenuItem
            // 
            this.openDrawingToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("openDrawingToolStripMenuItem.Image")));
            this.openDrawingToolStripMenuItem.Name = "openDrawingToolStripMenuItem";
            this.openDrawingToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.openDrawingToolStripMenuItem.Text = "Open Drawing";
            this.openDrawingToolStripMenuItem.ToolTipText = "Open Selected Item\'s Drawing";
            this.openDrawingToolStripMenuItem.Click += new System.EventHandler(this.openDrawingToolStripMenuItem_Click);
            // 
            // editItemToolStripMenuItem
            // 
            this.editItemToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("editItemToolStripMenuItem.Image")));
            this.editItemToolStripMenuItem.Name = "editItemToolStripMenuItem";
            this.editItemToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.editItemToolStripMenuItem.Text = "Edit Item";
            this.editItemToolStripMenuItem.ToolTipText = "Edit Selected Item\'s Properties";
            this.editItemToolStripMenuItem.Click += new System.EventHandler(this.editItemToolStripMenuItem_Click);
            // 
            // copySelectedItemToolStripMenuItem
            // 
            this.copySelectedItemToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("copySelectedItemToolStripMenuItem.Image")));
            this.copySelectedItemToolStripMenuItem.Name = "copySelectedItemToolStripMenuItem";
            this.copySelectedItemToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.copySelectedItemToolStripMenuItem.Text = "Copy Selected Item";
            this.copySelectedItemToolStripMenuItem.ToolTipText = "Copy selected item to new item number";
            this.copySelectedItemToolStripMenuItem.Click += new System.EventHandler(this.copySelectedItemToolStripMenuItem_Click);
            // 
            // viewReportBOM
            // 
            this.viewReportBOM.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.billsOfMaunfacturingToolStripMenuItem,
            this.sparePartsToolStripMenuItem});
            this.viewReportBOM.Image = ((System.Drawing.Image)(resources.GetObject("viewReportBOM.Image")));
            this.viewReportBOM.Name = "viewReportBOM";
            this.viewReportBOM.Size = new System.Drawing.Size(176, 22);
            this.viewReportBOM.Text = "View Report (BOM)";
            this.viewReportBOM.ToolTipText = "View BOM Report";
            // 
            // billsOfMaunfacturingToolStripMenuItem
            // 
            this.billsOfMaunfacturingToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("billsOfMaunfacturingToolStripMenuItem.Image")));
            this.billsOfMaunfacturingToolStripMenuItem.Name = "billsOfMaunfacturingToolStripMenuItem";
            this.billsOfMaunfacturingToolStripMenuItem.Size = new System.Drawing.Size(191, 22);
            this.billsOfMaunfacturingToolStripMenuItem.Text = "Bills of Maunfacturing";
            this.billsOfMaunfacturingToolStripMenuItem.ToolTipText = "Preview Bills Of Manufacturing Report";
            this.billsOfMaunfacturingToolStripMenuItem.Click += new System.EventHandler(this.billsOfMaunfacturingToolStripMenuItem_Click);
            // 
            // sparePartsToolStripMenuItem
            // 
            this.sparePartsToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("sparePartsToolStripMenuItem.Image")));
            this.sparePartsToolStripMenuItem.Name = "sparePartsToolStripMenuItem";
            this.sparePartsToolStripMenuItem.Size = new System.Drawing.Size(191, 22);
            this.sparePartsToolStripMenuItem.Text = "Spare Parts";
            this.sparePartsToolStripMenuItem.ToolTipText = "Preview Spare Parts Report";
            this.sparePartsToolStripMenuItem.Click += new System.EventHandler(this.sparePartsToolStripMenuItem_Click);
            // 
            // deleteItemToolStripMenuItem
            // 
            this.deleteItemToolStripMenuItem.Enabled = false;
            this.deleteItemToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("deleteItemToolStripMenuItem.Image")));
            this.deleteItemToolStripMenuItem.Name = "deleteItemToolStripMenuItem";
            this.deleteItemToolStripMenuItem.Size = new System.Drawing.Size(176, 22);
            this.deleteItemToolStripMenuItem.Text = "Delete Item";
            this.deleteItemToolStripMenuItem.ToolTipText = "Delete Selected Item From Connect";
            this.deleteItemToolStripMenuItem.Visible = false;
            this.deleteItemToolStripMenuItem.Click += new System.EventHandler(this.deleteItemToolStripMenuItem_Click);
            // 
            // SPM_Connect
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.ClientSize = new System.Drawing.Size(984, 789);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.SPM);
            this.Controls.Add(this.recordlabel);
            this.Controls.Add(this.AddNewBttn);
            this.Controls.Add(this.jobsbttn);
            this.Controls.Add(this.listView);
            this.Controls.Add(this.admin_bttn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.Reload);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.filter4);
            this.Controls.Add(this.filteroemitem_txtbox);
            this.Controls.Add(this.filteroem_txtbox);
            this.Controls.Add(this.Descrip_txtbox);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MinimumSize = new System.Drawing.Size(600, 600);
            this.Name = "SPM_Connect";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SPM Connect - Eng.";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.SPM_Connect_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.SPM_Connect_FormClosed);
            this.Load += new System.EventHandler(this.SPM_Connect_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.FormSelector.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.inventoryBindingSource3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sPM_DatabaseDataSet)).EndInit();
            this.Listviewcontextmenu.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

		}

        

        #endregion
        private System.Windows.Forms.DataGridView dataGridView;
		private System.Windows.Forms.Button Reload;
		private System.Windows.Forms.TextBox Descrip_txtbox;
		private System.Windows.Forms.TextBox filteroem_txtbox;
		private System.Windows.Forms.TextBox filteroemitem_txtbox;
		private SPM_DatabaseDataSet sPM_DatabaseDataSet;
		private System.Windows.Forms.BindingSource inventoryBindingSource3;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox filter4;
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member 'SPM_Connect.txtSearch'
		public System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.ToolTip TreeViewToolTip;
        private System.Windows.Forms.ContextMenuStrip FormSelector;
        private System.Windows.Forms.ToolStripMenuItem bOMToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem whereUsedToolStripMenuItem;
        private System.Windows.Forms.Button admin_bttn;
        private System.Windows.Forms.ToolStripMenuItem openModelToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem openDrawingToolStripMenuItem;
        private System.Windows.Forms.ImageList imageList;
        private System.Windows.Forms.ListView listView;
        private System.Windows.Forms.ContextMenuStrip Listviewcontextmenu;
        private System.Windows.Forms.ToolStripMenuItem bomlistviewmenustrpc;
        private System.Windows.Forms.ToolStripMenuItem whereusedlistviewStripMenu;
        private System.Windows.Forms.ToolStripMenuItem iteminfolistviewStripMenu;
        private System.Windows.Forms.Button jobsbttn;
        private System.Windows.Forms.Button AddNewBttn;
        private System.Windows.Forms.ToolStripMenuItem editItemToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem deleteItemToolStripMenuItem;
        public System.Windows.Forms.Timer timer2;
        private System.Windows.Forms.DataGridViewTextBoxColumn itemNumberDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn descriptionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn familyCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufacturerDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufacturerItemNumberDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label recordlabel;
        private System.Windows.Forms.ToolStripMenuItem viewReportBOM;
        private System.Windows.Forms.ToolStripMenuItem billsOfMaunfacturingToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sparePartsToolStripMenuItem;
        private System.Windows.Forms.Label SPM;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ToolStripMenuItem copySelectedItemToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;


#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member 'SPM_Connect.txtSearch'
    }
}

