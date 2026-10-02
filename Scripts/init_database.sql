/*
====================================================================
Create Database and Schemas
====================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three
    within the database: 'bronze', 'silver', and 'gold'.


WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

use master;
go
  
--drop and recreate the datawarehouse and also checks the database is only used by singl user 
if exists (select 1 from sys.database where name = 'DataWarehouse')
begin
  alter database DataWarehouse set single_user with rollback immediate;
  drop database DataWarehouse;
end;

go
  
--create database 
create database DataWarehouse;
use DataWarehouse;

--create schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
