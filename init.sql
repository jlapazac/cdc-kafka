-- Database creation
CREATE DATABASE Test_DB;
GO
USE Test_DB;

-- Table creation
CREATE TABLE employee (id INTEGER IDENTITY(1001,1) NOT NULL PRIMARY KEY,
            first_name VARCHAR(255) NOT NULL,
            last_name VARCHAR(255) NOT NULL,  
            email VARCHAR(255) NOT NULL UNIQUE);
INSERT INTO employee(first_name,last_name,email)
  VALUES ('Jeff','Thomas','thomas.jeff@afer.com'),
  ('Sasha','Bailey','s.bailey@foobar.com'),
  ('Edward','Hart','edhart@walker.com');

USE Test_DB;

EXEC sys.sp_cdc_enable_db;

ALTER DATABASE Test_DB SET CHANGE_TRACKING = ON (CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON);

-- Enable CDC at Table level
EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'employee', @role_name = NULL,
@capture_instance='employee_instance', @supports_net_changes = 1;

-- source_schema is the database object
-- source_name is the table name
-- capture_instance is the name of the instance of the CDC enabled table