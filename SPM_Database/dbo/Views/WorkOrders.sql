﻿
CREATE view  [dbo].[WorkOrders]
as
SELECT [Job]
      ,[WorkOrder]
      ,[ParentWorkOrder]
      ,[Product]
      ,[Item]
      ,[Description1]
      ,[Description2]
      ,[LEVEL]
      ,[JobType]
      ,[PlannedQuantity]
      ,[ProducedDate]
      ,[StartDate]
      ,[DeliveryDate]
      ,[CreateDate]
      ,[LastUpdate]
      ,[LastUser]
      ,[CustomerName]
      ,[QtyOfPrintedCopy]
      ,[Active]
      ,[WorkOrderStatus]
      ,[WorkOrderStatusLink]
      ,[FullSearch]
      ,[SalesOrderNumber]
  FROM [SPMDB].[dbo].[vgJcoWorkOrder]
