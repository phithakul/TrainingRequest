USE MBus;
GO

exec sp_msforeachtable 'Drop table ?'
GO