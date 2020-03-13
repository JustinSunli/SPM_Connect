﻿CREATE TABLE [dbo].[Purchase_Order] (
    [Purchase Order Number]    NVARCHAR (255) NULL,
    [Supplier Number]          NVARCHAR (255) NULL,
    [PO Date]                  DATETIME       NULL,
    [Inv Date]                 DATETIME       NULL,
    [Due Date]                 DATETIME       NULL,
    [Ship To Contact]          NVARCHAR (255) NULL,
    [Bill To Contact]          NVARCHAR (255) NULL,
    [Ordered By]               NVARCHAR (255) NULL,
    [Terms]                    NVARCHAR (255) NULL,
    [FOB]                      NVARCHAR (255) NULL,
    [Shipped Via]              NVARCHAR (255) NULL,
    [Ship Date]                DATETIME       NULL,
    [Approved by]              NVARCHAR (255) NULL,
    [Approved date]            DATETIME       NULL,
    [Tax1]                     MONEY          NULL,
    [Tax2]                     MONEY          NULL,
    [Freight]                  MONEY          NULL,
    [Freight Tax1]             BIT            NOT NULL,
    [Freight Tax2]             BIT            NOT NULL,
    [Other]                    MONEY          NULL,
    [Other Tax1]               BIT            NOT NULL,
    [Other Tax2]               BIT            NOT NULL,
    [Total]                    MONEY          NULL,
    [Received]                 BIT            NOT NULL,
    [Paid]                     BIT            NOT NULL,
    [Ship Customer Display]    FLOAT (53)     NULL,
    [Bill Customer Display]    FLOAT (53)     NULL,
    [Note]                     NVARCHAR (MAX) NULL,
    [Label]                    NVARCHAR (255) NULL,
    [Currency]                 NVARCHAR (255) NULL,
    [Supplier Company]         NVARCHAR (255) NULL,
    [Supplier Name]            NVARCHAR (255) NULL,
    [Supplier Suite]           NVARCHAR (255) NULL,
    [Supplier Street]          NVARCHAR (255) NULL,
    [Supplier CityStZip]       NVARCHAR (255) NULL,
    [Supplier Country]         NVARCHAR (255) NULL,
    [Supplier Phone]           NVARCHAR (255) NULL,
    [Supplier Fax]             NVARCHAR (255) NULL,
    [Bill to Company]          NVARCHAR (255) NULL,
    [Bill To Contact Name]     NVARCHAR (255) NULL,
    [Bill to Suite]            NVARCHAR (255) NULL,
    [Bill to Street]           NVARCHAR (255) NULL,
    [Bill To City State Zip]   NVARCHAR (255) NULL,
    [Bill to Country]          NVARCHAR (255) NULL,
    [Bill to Phone]            NVARCHAR (255) NULL,
    [Bill to Fax]              NVARCHAR (255) NULL,
    [Ship to Company]          NVARCHAR (255) NULL,
    [Ship to Contact Name]     NVARCHAR (255) NULL,
    [Ship to Suite]            NVARCHAR (255) NULL,
    [Ship to Street]           NVARCHAR (255) NULL,
    [Ship to City State Zip]   NVARCHAR (255) NULL,
    [Ship to Country]          NVARCHAR (255) NULL,
    [Ship to Phone]            NVARCHAR (255) NULL,
    [Ship to Fax]              NVARCHAR (255) NULL,
    [Select]                   BIT            NOT NULL,
    [Confirmation Number]      NVARCHAR (255) NULL,
    [Label Company]            NVARCHAR (255) NULL,
    [Job and Subassembly Info] NVARCHAR (255) NULL,
    [Tax1 Rate]                FLOAT (53)     NULL,
    [Tax2 Rate]                FLOAT (53)     NULL
);
