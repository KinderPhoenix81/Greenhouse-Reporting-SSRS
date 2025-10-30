Create Procedure sp_GetIncomingProducts
As
Select pi.ProductID, pi.ProductName, oi.Quantity, o.OrderDate, o.OrderID
From OrderItems oi Inner Join
ProductItems pi on oi.ProductID = pi.ProductID
Inner Join Orders o on oi.OrderID = o.OrderID
Where pi.QuantityInStock <= 0 AND o.received = 0

Create Procedure sp_EmployeeDetails @Id int
As
Select *
From Employees e
Where e.EmployeeID = @Id

Create Procedure sp_UnpaidTotal
As
Select SUM(i.InvoiceTotal) As OutstandingBalance
From Invoices i
Where i.Paid = 0

Create Procedure sp_UpcomingPayments
As
Select i.InvoiceDate, i.InvoiceTotal
From Invoices i
Where i.InvoiceDueDate > GetDate()

Create Procedure sp_PastDueInvoices
As
Select i.InvoiceID, i.InvoiceTotal, i.InvoiceDueDate
From Invoices i
Where i.InvoiceDueDate < GetDate() AND i.Paid = 0