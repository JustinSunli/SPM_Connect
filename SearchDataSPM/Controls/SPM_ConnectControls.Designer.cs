﻿namespace SearchDataSPM
{
	partial class SPM_ConnectControls
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SPM_ConnectControls));
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.itemNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.descriptionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.familyCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufacturerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufacturerItemNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FormSelector = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.addToCatalogToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.createAssemblyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bOMToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoCadCatalogToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.geniusToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whereUsedToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoCadCatalogToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.geniusJobsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.inventoryBindingSource3 = new System.Windows.Forms.BindingSource(this.components);
            this.sPM_DatabaseDataSet = new SearchDataSPM.SPM_DatabaseDataSet();
            this.Reload = new System.Windows.Forms.Button();
            this.Descrip_txtbox = new System.Windows.Forms.TextBox();
            this.filteroem_txtbox = new System.Windows.Forms.TextBox();
            this.filteroemitem_txtbox = new System.Windows.Forms.TextBox();
            this.SPM = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.filter4 = new System.Windows.Forms.TextBox();
            this.inventoryTableAdapter = new SearchDataSPM.SPM_DatabaseDataSetTableAdapters.InventoryTableAdapter();
            this.tableAdapterManager = new SearchDataSPM.SPM_DatabaseDataSetTableAdapters.TableAdapterManager();
            this.TreeViewToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.admin_bttn = new System.Windows.Forms.Button();
            this.jobsbttn = new System.Windows.Forms.Button();
            this.getnewitembttn = new System.Windows.Forms.Button();
            this.recordlabel = new System.Windows.Forms.Label();
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.FormSelector.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.inventoryBindingSource3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sPM_DatabaseDataSet)).BeginInit();
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
            this.txtSearch.Location = new System.Drawing.Point(210, 10);
            this.txtSearch.MaximumSize = new System.Drawing.Size(32767, 25);
            this.txtSearch.MinimumSize = new System.Drawing.Size(4, 23);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(580, 26);
            this.txtSearch.TabIndex = 1;
            this.TreeViewToolTip.SetToolTip(this.txtSearch, "Enter Search Keyword");
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
            this.dataGridView.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(237)))), ((int)(((byte)(237)))), ((int)(((byte)(237)))));
            this.dataGridView.Location = new System.Drawing.Point(2, 100);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RowHeadersVisible = false;
            this.dataGridView.Size = new System.Drawing.Size(980, 659);
            this.dataGridView.TabIndex = 6;
            this.dataGridView.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellDoubleClick);
            this.dataGridView.CellMouseDown += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView_CellMouseDown);
            this.dataGridView.CellMouseLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellMouseLeave);
            this.dataGridView.CellMouseMove += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView_CellMouseMove);
            this.dataGridView.CellPainting += new System.Windows.Forms.DataGridViewCellPaintingEventHandler(this.dataGridView_CellPainting_1);
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
            this.addToCatalogToolStripMenuItem,
            this.createAssemblyToolStripMenuItem,
            this.bOMToolStripMenuItem,
            this.whereUsedToolStripMenuItem});
            this.FormSelector.Name = "contextMenuStrip1";
            this.FormSelector.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.FormSelector.Size = new System.Drawing.Size(163, 92);
            // 
            // addToCatalogToolStripMenuItem
            // 
            this.addToCatalogToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("addToCatalogToolStripMenuItem.Image")));
            this.addToCatalogToolStripMenuItem.Name = "addToCatalogToolStripMenuItem";
            this.addToCatalogToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.addToCatalogToolStripMenuItem.Text = "Add To Catalog";
            this.addToCatalogToolStripMenuItem.Click += new System.EventHandler(this.addToCatalogToolStripMenuItem_Click);
            // 
            // createAssemblyToolStripMenuItem
            // 
            this.createAssemblyToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("createAssemblyToolStripMenuItem.Image")));
            this.createAssemblyToolStripMenuItem.Name = "createAssemblyToolStripMenuItem";
            this.createAssemblyToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.createAssemblyToolStripMenuItem.Text = "Create Assembly";
            this.createAssemblyToolStripMenuItem.Click += new System.EventHandler(this.createAssemblyToolStripMenuItem_Click);
            // 
            // bOMToolStripMenuItem
            // 
            this.bOMToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.autoCadCatalogToolStripMenuItem,
            this.geniusToolStripMenuItem});
            this.bOMToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("bOMToolStripMenuItem.Image")));
            this.bOMToolStripMenuItem.Name = "bOMToolStripMenuItem";
            this.bOMToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.bOMToolStripMenuItem.Text = "BOM";
            this.bOMToolStripMenuItem.ToolTipText = "Bills Of Material";
            this.bOMToolStripMenuItem.Click += new System.EventHandler(this.bOMToolStripMenuItem_Click);
            // 
            // autoCadCatalogToolStripMenuItem
            // 
            this.autoCadCatalogToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("autoCadCatalogToolStripMenuItem.Image")));
            this.autoCadCatalogToolStripMenuItem.Name = "autoCadCatalogToolStripMenuItem";
            this.autoCadCatalogToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.autoCadCatalogToolStripMenuItem.Text = "AutoCad Catalog";
            this.autoCadCatalogToolStripMenuItem.ToolTipText = "Displays assy from AutoCad Catalog";
            this.autoCadCatalogToolStripMenuItem.Click += new System.EventHandler(this.autoCadCatalogToolStripMenuItem_Click);
            // 
            // geniusToolStripMenuItem
            // 
            this.geniusToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("geniusToolStripMenuItem.Image")));
            this.geniusToolStripMenuItem.Name = "geniusToolStripMenuItem";
            this.geniusToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.geniusToolStripMenuItem.Text = "SPM Jobs";
            this.geniusToolStripMenuItem.ToolTipText = "Display BOM from Genius";
            this.geniusToolStripMenuItem.Click += new System.EventHandler(this.geniusToolStripMenuItem_Click);
            // 
            // whereUsedToolStripMenuItem
            // 
            this.whereUsedToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.autoCadCatalogToolStripMenuItem1,
            this.geniusJobsToolStripMenuItem});
            this.whereUsedToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("whereUsedToolStripMenuItem.Image")));
            this.whereUsedToolStripMenuItem.Name = "whereUsedToolStripMenuItem";
            this.whereUsedToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.whereUsedToolStripMenuItem.Text = "Where Used";
            this.whereUsedToolStripMenuItem.ToolTipText = "Check Where Used";
            // 
            // autoCadCatalogToolStripMenuItem1
            // 
            this.autoCadCatalogToolStripMenuItem1.Image = ((System.Drawing.Image)(resources.GetObject("autoCadCatalogToolStripMenuItem1.Image")));
            this.autoCadCatalogToolStripMenuItem1.Name = "autoCadCatalogToolStripMenuItem1";
            this.autoCadCatalogToolStripMenuItem1.Size = new System.Drawing.Size(165, 22);
            this.autoCadCatalogToolStripMenuItem1.Text = "AutoCad Catalog";
            this.autoCadCatalogToolStripMenuItem1.ToolTipText = "Check where used on Autocad Catalog";
            this.autoCadCatalogToolStripMenuItem1.Click += new System.EventHandler(this.autoCadCatalogToolStripMenuItem1_Click);
            // 
            // geniusJobsToolStripMenuItem
            // 
            this.geniusJobsToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("geniusJobsToolStripMenuItem.Image")));
            this.geniusJobsToolStripMenuItem.Name = "geniusJobsToolStripMenuItem";
            this.geniusJobsToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.geniusJobsToolStripMenuItem.Text = "SPM Jobs";
            this.geniusJobsToolStripMenuItem.ToolTipText = "Check where used on Genius";
            this.geniusJobsToolStripMenuItem.Click += new System.EventHandler(this.geniusJobsToolStripMenuItem_Click);
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
            this.Reload.Location = new System.Drawing.Point(790, 8);
            this.Reload.MaximumSize = new System.Drawing.Size(140, 30);
            this.Reload.MinimumSize = new System.Drawing.Size(140, 30);
            this.Reload.Name = "Reload";
            this.Reload.Size = new System.Drawing.Size(140, 30);
            this.Reload.TabIndex = 7;
            this.Reload.Text = "Refresh / Show All";
            this.TreeViewToolTip.SetToolTip(this.Reload, "Click To Reset \r\nOr\r\nPress Home Button");
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
            this.Descrip_txtbox.Location = new System.Drawing.Point(210, 50);
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
            this.filteroem_txtbox.Location = new System.Drawing.Point(396, 50);
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
            this.filteroemitem_txtbox.Location = new System.Drawing.Point(582, 50);
            this.filteroemitem_txtbox.MaximumSize = new System.Drawing.Size(180, 26);
            this.filteroemitem_txtbox.MinimumSize = new System.Drawing.Size(120, 25);
            this.filteroemitem_txtbox.Name = "filteroemitem_txtbox";
            this.filteroemitem_txtbox.Size = new System.Drawing.Size(180, 26);
            this.filteroemitem_txtbox.TabIndex = 4;
            this.TreeViewToolTip.SetToolTip(this.filteroemitem_txtbox, "Enter keyworkd 4");
            this.filteroemitem_txtbox.Visible = false;
            this.filteroemitem_txtbox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.filteroemitem_txtbox_KeyDown);
            // 
            // SPM
            // 
            this.SPM.BackColor = System.Drawing.Color.Transparent;
            this.SPM.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SPM.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.SPM.Image = ((System.Drawing.Image)(resources.GetObject("SPM.Image")));
            this.SPM.Location = new System.Drawing.Point(0, 6);
            this.SPM.Name = "SPM";
            this.SPM.Size = new System.Drawing.Size(200, 85);
            this.SPM.TabIndex = 10;
            this.SPM.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.TreeViewToolTip.SetToolTip(this.SPM, "SPM Automation Inc.");
            this.SPM.DoubleClick += new System.EventHandler(this.SPM_DoubleClick);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 6F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(954, 4);
            this.label1.MaximumSize = new System.Drawing.Size(26, 8);
            this.label1.MinimumSize = new System.Drawing.Size(26, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 8);
            this.label1.TabIndex = 11;
            this.label1.Text = "V6.8.0";
            this.TreeViewToolTip.SetToolTip(this.label1, "SPM Connect V6.8.0");
            // 
            // filter4
            // 
            this.filter4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filter4.BackColor = System.Drawing.SystemColors.MenuBar;
            this.filter4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.filter4.Location = new System.Drawing.Point(768, 50);
            this.filter4.MaximumSize = new System.Drawing.Size(180, 26);
            this.filter4.MinimumSize = new System.Drawing.Size(120, 25);
            this.filter4.Name = "filter4";
            this.filter4.Size = new System.Drawing.Size(180, 26);
            this.filter4.TabIndex = 5;
            this.TreeViewToolTip.SetToolTip(this.filter4, "Enter Keyword 5");
            this.filter4.Visible = false;
            this.filter4.KeyDown += new System.Windows.Forms.KeyEventHandler(this.filter4_KeyDown);
            // 
            // inventoryTableAdapter
            // 
            this.inventoryTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.InventoryTableAdapter = this.inventoryTableAdapter;
            this.tableAdapterManager.UpdateOrder = SearchDataSPM.SPM_DatabaseDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // TreeViewToolTip
            // 
            this.TreeViewToolTip.AutoPopDelay = 4000;
            this.TreeViewToolTip.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.TreeViewToolTip.InitialDelay = 500;
            this.TreeViewToolTip.ReshowDelay = 100;
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
            this.admin_bttn.Location = new System.Drawing.Point(954, 50);
            this.admin_bttn.MaximumSize = new System.Drawing.Size(40, 40);
            this.admin_bttn.MinimumSize = new System.Drawing.Size(25, 25);
            this.admin_bttn.Name = "admin_bttn";
            this.admin_bttn.Size = new System.Drawing.Size(25, 26);
            this.admin_bttn.TabIndex = 19;
            this.admin_bttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.admin_bttn, "Adminstrative Control");
            this.admin_bttn.UseVisualStyleBackColor = false;
            this.admin_bttn.Click += new System.EventHandler(this.admin_bttn_Click);
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
            this.jobsbttn.Location = new System.Drawing.Point(954, 15);
            this.jobsbttn.MaximumSize = new System.Drawing.Size(25, 25);
            this.jobsbttn.MinimumSize = new System.Drawing.Size(25, 25);
            this.jobsbttn.Name = "jobsbttn";
            this.jobsbttn.Size = new System.Drawing.Size(25, 25);
            this.jobsbttn.TabIndex = 21;
            this.jobsbttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.jobsbttn, "SPM Job Numbers");
            this.jobsbttn.UseVisualStyleBackColor = false;
            this.jobsbttn.Click += new System.EventHandler(this.jobsbttn_Click);
            // 
            // getnewitembttn
            // 
            this.getnewitembttn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.getnewitembttn.BackColor = System.Drawing.Color.Transparent;
            this.getnewitembttn.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.getnewitembttn.FlatAppearance.BorderSize = 0;
            this.getnewitembttn.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.getnewitembttn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.getnewitembttn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.getnewitembttn.ForeColor = System.Drawing.Color.Transparent;
            this.getnewitembttn.Image = ((System.Drawing.Image)(resources.GetObject("getnewitembttn.Image")));
            this.getnewitembttn.Location = new System.Drawing.Point(930, 15);
            this.getnewitembttn.MaximumSize = new System.Drawing.Size(25, 25);
            this.getnewitembttn.MinimumSize = new System.Drawing.Size(25, 25);
            this.getnewitembttn.Name = "getnewitembttn";
            this.getnewitembttn.Size = new System.Drawing.Size(25, 25);
            this.getnewitembttn.TabIndex = 104;
            this.getnewitembttn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.TreeViewToolTip.SetToolTip(this.getnewitembttn, "What\'s My Next Item No.");
            this.getnewitembttn.UseVisualStyleBackColor = false;
            this.getnewitembttn.Click += new System.EventHandler(this.getnewitembttn_Click);
            // 
            // recordlabel
            // 
            this.recordlabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.recordlabel.AutoSize = true;
            this.recordlabel.Font = new System.Drawing.Font("Maiandra GD", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.recordlabel.ForeColor = System.Drawing.Color.White;
            this.recordlabel.Location = new System.Drawing.Point(820, 83);
            this.recordlabel.Name = "recordlabel";
            this.recordlabel.Size = new System.Drawing.Size(0, 14);
            this.recordlabel.TabIndex = 103;
            // 
            // timer2
            // 
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // SPM_ConnectControls
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(133)))), ((int)(((byte)(197)))));
            this.ClientSize = new System.Drawing.Size(984, 761);
            this.Controls.Add(this.getnewitembttn);
            this.Controls.Add(this.recordlabel);
            this.Controls.Add(this.jobsbttn);
            this.Controls.Add(this.admin_bttn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.SPM);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.Reload);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.filter4);
            this.Controls.Add(this.filteroemitem_txtbox);
            this.Controls.Add(this.filteroem_txtbox);
            this.Controls.Add(this.Descrip_txtbox);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(500, 500);
            this.Name = "SPM_ConnectControls";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SPM Connect - Controls";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.SPM_ConnectControls_FormClosed);
            this.Load += new System.EventHandler(this.SPM_Connect_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.FormSelector.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.inventoryBindingSource3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sPM_DatabaseDataSet)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion
		private System.Windows.Forms.DataGridView dataGridView;
		private System.Windows.Forms.Button Reload;
		private System.Windows.Forms.TextBox Descrip_txtbox;
		private System.Windows.Forms.TextBox filteroem_txtbox;
		private System.Windows.Forms.TextBox filteroemitem_txtbox;
		private System.Windows.Forms.Label SPM;
		private SPM_DatabaseDataSet sPM_DatabaseDataSet;
		private System.Windows.Forms.BindingSource inventoryBindingSource3;
		private SPM_DatabaseDataSetTableAdapters.InventoryTableAdapter inventoryTableAdapter;
		private SPM_DatabaseDataSetTableAdapters.TableAdapterManager tableAdapterManager;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox filter4;
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member 'SPM_Connect.txtSearch'
		public System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.ToolTip TreeViewToolTip;
        private System.Windows.Forms.ContextMenuStrip FormSelector;
        private System.Windows.Forms.ToolStripMenuItem bOMToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem whereUsedToolStripMenuItem;
        private System.Windows.Forms.DataGridViewTextBoxColumn itemNumberDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn descriptionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn familyCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufacturerDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufacturerItemNumberDataGridViewTextBoxColumn;
        private System.Windows.Forms.ToolStripMenuItem addToCatalogToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoCadCatalogToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem geniusToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoCadCatalogToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem geniusJobsToolStripMenuItem;
        private System.Windows.Forms.Button admin_bttn;
        private System.Windows.Forms.ToolStripMenuItem createAssemblyToolStripMenuItem;
        private System.Windows.Forms.Button jobsbttn;
        private System.Windows.Forms.Label recordlabel;
        private System.Windows.Forms.Button getnewitembttn;
        public System.Windows.Forms.Timer timer2;
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member 'SPM_Connect.txtSearch'
    }
}
