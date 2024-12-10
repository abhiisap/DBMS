-- Drop existing objects (if any)
DROP TYPE LeaseContractType FORCE;
DROP TYPE TenantType FORCE;
DROP TYPE PropertyOwnerType FORCE;
DROP TYPE PropertyType FORCE;
DROP TYPE AddressType FORCE;
DROP TYPE ContactType FORCE;

DROP TABLE LeaseContract CASCADE CONSTRAINTS;
DROP TABLE Tenant CASCADE CONSTRAINTS;
DROP TABLE PropertyOwner CASCADE CONSTRAINTS;
DROP TABLE Property CASCADE CONSTRAINTS;

-- Create user-defined types
CREATE OR REPLACE TYPE AddressType AS OBJECT (
  Street VARCHAR2(50),
  City VARCHAR2(50),
  State VARCHAR2(2),
  ZipCode VARCHAR2(10)
);

CREATE OR REPLACE TYPE ContactType AS OBJECT (
  Email VARCHAR2(50),
  Phone VARCHAR2(15)
);

CREATE OR REPLACE TYPE PropertyType AS OBJECT (
  PropertyID NUMBER,
  Address AddressType,
  Type VARCHAR2(50),
  Bedrooms NUMBER,
  Bathrooms NUMBER,
  RentAmount NUMBER,
  MEMBER FUNCTION getPropertyInfo RETURN VARCHAR2
);






CREATE OR REPLACE TYPE TenantType AS OBJECT (
  TenantID NUMBER,
  Name VARCHAR2(50),
  ContactInfo ContactType,
  MEMBER FUNCTION getTenantInfo RETURN VARCHAR2
) NOT FINAL;

CREATE OR REPLACE TYPE LeaseContractType AS OBJECT (
  ContractID NUMBER,
  StartDate DATE,
  EndDate DATE,
  MEMBER FUNCTION calculateTotalRent RETURN NUMBER
);

CREATE OR REPLACE TYPE PropertyOwnerType UNDER TenantType (
  OwnerID NUMBER,
  MEMBER FUNCTION addProperty RETURN VARCHAR2,
  MEMBER FUNCTION generateReport RETURN VARCHAR2
);

-- Create tables
CREATE TABLE Property OF PropertyType (
  PRIMARY KEY (PropertyID),
  CONSTRAINT chk_bedrooms CHECK (Bedrooms > 0),
  CONSTRAINT chk_bathrooms CHECK (Bathrooms > 0)
);



CREATE TABLE Tenant OF TenantType (
  PRIMARY KEY (TenantID),
  CONSTRAINT chk_name CHECK (LENGTH(Name) > 0)
);

CREATE TABLE LeaseContract (
  ContractID NUMBER PRIMARY KEY,
  LeaseInfo LeaseContractType,
  PropertyID NUMBER,
  TenantID NUMBER,
  StartDate DATE,
  EndDate DATE,
  CONSTRAINT chk_dates CHECK (EndDate >= StartDate),
  FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
  FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID)
);

CREATE TABLE PropertyOwner OF PropertyOwnerType (
  PRIMARY KEY (OwnerID),
  FOREIGN KEY (OwnerID) REFERENCES Tenant(TenantID)
);





-- Insert sample data
-- Insert sample data into Property table
INSERT INTO Property VALUES (1, AddressType('456 Oak St', 'Townsville', 'CA', '90345'), 'House', 3, 2, 2000);
INSERT INTO Property VALUES (2, AddressType('789 Pine St', 'Villageton', 'CA', '90456'), 'Condo', 1, 1, 1200);
INSERT INTO Property VALUES (3, AddressType('101 Cedar St', 'Hamletville', 'CA', '90567'), 'Apartment', 2, 1, 1500);
INSERT INTO Property VALUES (4, AddressType('202 Maple St', 'Suburbia', 'CA', '90678'), 'House', 4, 3, 2500);
INSERT INTO Property VALUES (5, AddressType('303 Elm St', 'Ruralville', 'CA', '90789'), 'Condo', 2, 2, 1800);
INSERT INTO Property VALUES (6, AddressType('404 Birch St', 'Countryside', 'CA', '90890'), 'House', 3, 2, 2100);
INSERT INTO Property VALUES (7, AddressType('505 Walnut St', 'Mountainview', 'CA', '90901'), 'Condo', 1, 1, 1300);
INSERT INTO Property VALUES (8, AddressType('606 Pineapple St', 'Seasidetown', 'CA', '91012'), 'Apartment', 2, 1, 1600);

SELECT * FROM Property


-- Insert sample data into Tenant table
INSERT INTO Tenant VALUES (1, 'Rojan Shrestha', ContactType('rojan@email.com', '987-654-3210'));
INSERT INTO Tenant VALUES (2, 'Anuj Poudel', ContactType('anup@email.com', '234-567-8901'));
INSERT INTO Tenant VALUES (3, 'Aashika Ghimire', ContactType('aashika@email.com', '345-678-9012'));
INSERT INTO Tenant VALUES (4, 'Aashirwad Acharya', ContactType('aashir@email.com', '456-789-0123'));
INSERT INTO Tenant VALUES (5, 'Cristiano Ronaldo', ContactType('cristiano@email.com', '567-890-1234'));
INSERT INTO Tenant VALUES (6, 'Virat Kohli', ContactType('viru@email.com', '678-901-2345'));
INSERT INTO Tenant VALUES (7, 'Harry Kane', ContactType('harry@email.com', '789-012-3456'));
INSERT INTO Tenant VALUES (8, 'Eoin Morgan', ContactType('eoin@email.com', '890-123-4567'));



SELECT * FROM Tenant


-- Insert sample data into LeaseContract table
INSERT INTO LeaseContract VALUES (1, LeaseContractType(2, SYSDATE, SYSDATE + 365), 1, 1, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (2, LeaseContractType(3, SYSDATE, SYSDATE + 365), 2, 2, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (3, LeaseContractType(4, SYSDATE, SYSDATE + 365), 3, 3, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (4, LeaseContractType(5, SYSDATE, SYSDATE + 365), 4, 4, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (5, LeaseContractType(6, SYSDATE, SYSDATE + 365), 5, 5, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (6, LeaseContractType(7, SYSDATE, SYSDATE + 365), 6, 6, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (7, LeaseContractType(8, SYSDATE, SYSDATE + 365), 7, 7, SYSDATE, SYSDATE + 365);
INSERT INTO LeaseContract VALUES (8, LeaseContractType(9, SYSDATE, SYSDATE + 365), 8, 8, SYSDATE, SYSDATE + 365);



SELECT * FROM LeaseContract


-- Insert sample data into PropertyOwner table
INSERT INTO PropertyOwner VALUES (1, 'Sachin Tendulkar', ContactType('sachin@email.com', '987-654-3210'), 1);
INSERT INTO PropertyOwner VALUES (2, 'Kobe Bryant', ContactType('kobe@email.com', '234-567-8901'), 2);
INSERT INTO PropertyOwner VALUES (3, 'Jude Bellingham', ContactType('jude@email.com', '345-678-9012'), 3);
INSERT INTO PropertyOwner VALUES (4, 'Michael Corleone', ContactType('michael@email.com', '456-789-0123'), 4);
INSERT INTO PropertyOwner VALUES (5, 'Bukayo Saka', ContactType('bukay@email.com', '567-890-1234'), 5);
INSERT INTO PropertyOwner VALUES (6, 'Martin Luther', ContactType('luther@email.com', '678-901-2345'), 6);
INSERT INTO PropertyOwner VALUES (7, 'John Cena', ContactType('john@email.com', '789-012-3456'), 7);
INSERT INTO PropertyOwner VALUES (8, 'Toni Kroos', ContactType('toni@email.com', '890-123-4567'), 8);


SELECT * FROM PropertyOwner

-- Update operations on Property table
UPDATE Property SET RentAmount = 1800 WHERE PropertyID = 8;
UPDATE Property SET Bedrooms = 3, Bathrooms = 2 WHERE PropertyID = 3;

-- Update operations on Tenant table
UPDATE Tenant SET Name = 'Luka Modric' WHERE TenantID = 1;
UPDATE Tenant SET ContactInfo = ContactType('lukita@email.com', '987-654-3210') WHERE TenantID = 2;

-- Update operations on LeaseContract table
UPDATE LeaseContract SET StartDate = SYSDATE - 30, EndDate = SYSDATE + 335 WHERE ContractID = 7;
UPDATE LeaseContract SET TenantID = 1 WHERE ContractID = 2;

-- Update operations on PropertyOwner table
UPDATE PropertyOwner SET Name = 'Sergio Ramos' WHERE OwnerID = 6;
UPDATE PropertyOwner SET ContactInfo = ContactType('sramos@email.com', '987-654-3210') WHERE OwnerID = 5;



-- Delete operations on LeaseContract table
DELETE FROM LeaseContract WHERE TenantID = 4;

-- Delete operations on PropertyOwner table
DELETE FROM PropertyOwner WHERE OwnerID = 2;















-- Stored Procedure for Inserting into Property Table
CREATE OR REPLACE PROCEDURE InsertProperty(
    p_Street VARCHAR2,
    p_City VARCHAR2,
    p_State VARCHAR2,
    p_ZipCode VARCHAR2,
    p_Type VARCHAR2,
    p_Bedrooms NUMBER,
    p_Bathrooms NUMBER,
    p_RentAmount NUMBER
) AS
BEGIN
    INSERT INTO Property VALUES (
        (SELECT NVL(MAX(PropertyID), 0) + 1 FROM Property),
        AddressType(p_Street, p_City, p_State, p_ZipCode),
        p_Type,
        p_Bedrooms,
        p_Bathrooms,
        p_RentAmount
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Property Inserted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertProperty;
/

-- Stored Procedure for Updating Property Table
CREATE OR REPLACE PROCEDURE UpdateProperty(
    p_PropertyID NUMBER,
    p_RentAmount NUMBER,
    p_Bedrooms NUMBER,
    p_Bathrooms NUMBER
) AS
BEGIN
    UPDATE Property
    SET RentAmount = p_RentAmount,
        Bedrooms = p_Bedrooms,
        Bathrooms = p_Bathrooms
    WHERE PropertyID = p_PropertyID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Property Updated Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateProperty;
/

-- Stored Procedure for Deleting from Property Table
CREATE OR REPLACE PROCEDURE DeleteProperty(p_PropertyID NUMBER) AS
BEGIN
    DELETE FROM Property WHERE PropertyID = p_PropertyID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Property Deleted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END DeleteProperty;
/


-- Stored Procedure for Inserting into Tenant Table
CREATE OR REPLACE PROCEDURE InsertTenant(
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Phone VARCHAR2
) AS
BEGIN
    INSERT INTO Tenant VALUES (
        (SELECT NVL(MAX(TenantID), 0) + 1 FROM Tenant),
        p_Name,
        ContactType(p_Email, p_Phone)
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant Inserted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertTenant;
/

-- Stored Procedure for Updating Tenant Table
CREATE OR REPLACE PROCEDURE UpdateTenant(
    p_TenantID NUMBER,
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Phone VARCHAR2
) AS
BEGIN
    UPDATE Tenant
    SET Name = p_Name,
        ContactInfo = ContactType(p_Email, p_Phone)
    WHERE TenantID = p_TenantID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant Updated Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateTenant;
/

-- Stored Procedure for Deleting from Tenant Table
CREATE OR REPLACE PROCEDURE DeleteTenant(p_TenantID NUMBER) AS
BEGIN
    DELETE FROM Tenant WHERE TenantID = p_TenantID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant Deleted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END DeleteTenant;
/


-- Stored Procedure for Inserting into LeaseContract Table
CREATE OR REPLACE PROCEDURE InsertLeaseContract(
    p_StartDate DATE,
    p_EndDate DATE,
    p_PropertyID NUMBER,
    p_TenantID NUMBER
) AS
BEGIN
    INSERT INTO LeaseContract (
        ContractID,
        LeaseInfo,
        PropertyID,
        TenantID,
        StartDate,
        EndDate
    ) VALUES (
        (SELECT NVL(MAX(ContractID), 0) + 1 FROM LeaseContract),
        LeaseContractType(2, p_StartDate, p_EndDate),
        p_PropertyID,
        p_TenantID,
        p_StartDate,
        p_EndDate
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('LeaseContract Inserted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertLeaseContract;
/


-- Stored Procedure for Updating LeaseContract Table
CREATE OR REPLACE PROCEDURE UpdateLeaseContract(
    p_ContractID NUMBER,
    p_StartDate DATE,
    p_EndDate DATE,
    p_TenantID NUMBER
) AS
BEGIN
    UPDATE LeaseContract
    SET StartDate = p_StartDate,
        EndDate = p_EndDate,
        TenantID = p_TenantID
    WHERE ContractID = p_ContractID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('LeaseContract Updated Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateLeaseContract;
/

-- Stored Procedure for Deleting from LeaseContract Table
CREATE OR REPLACE PROCEDURE DeleteLeaseContract(p_ContractID NUMBER) AS
BEGIN
    DELETE FROM LeaseContract WHERE ContractID = p_ContractID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('LeaseContract Deleted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END DeleteLeaseContract;
/


-- Stored Procedure for Inserting into PropertyOwner Table
CREATE OR REPLACE PROCEDURE InsertPropertyOwner(
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Phone VARCHAR2,
    p_OwnerID NUMBER
) AS
BEGIN
    INSERT INTO PropertyOwner VALUES (
        p_OwnerID,
        p_Name,
        ContactType(p_Email, p_Phone),
        p_OwnerID
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('PropertyOwner Inserted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertPropertyOwner;
/

-- Stored Procedure for Updating PropertyOwner Table
CREATE OR REPLACE PROCEDURE UpdatePropertyOwner(
    p_OwnerID NUMBER,
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Phone VARCHAR2
) AS
BEGIN
    UPDATE PropertyOwner
    SET Name = p_Name,
        ContactInfo = ContactType(p_Email, p_Phone)
    WHERE OwnerID = p_OwnerID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('PropertyOwner Updated Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdatePropertyOwner;
/

-- Stored Procedure for Deleting from PropertyOwner Table
CREATE OR REPLACE PROCEDURE DeletePropertyOwner(p_OwnerID NUMBER) AS
BEGIN
    DELETE FROM PropertyOwner WHERE OwnerID = p_OwnerID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('PropertyOwner Deleted Successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END DeletePropertyOwner;
/


-- Execute the InsertProperty stored procedure with sample data
BEGIN
    InsertProperty('123 Maple St', 'Cityville', 'CA', '90123', 'Apartment', 2, 1, 1200);
END;
/

-- Execute the InsertTenant stored procedure with sample data
BEGIN
    InsertTenant('Iker Casillas', 'ikare@email.com', '123-456-7890');
END;
/

-- Execute the InsertLeaseContract stored procedure with sample data
BEGIN
    InsertLeaseContract(SYSDATE, SYSDATE + 365, 1, 1);
END;
/

-- Execute the InsertPropertyOwner stored procedure with sample data
BEGIN
    InsertPropertyOwner('Zinadine Zidane', 'zizou@email.com', '234-567-8901', 1);
END;
/

-- Execute the UpdateProperty stored procedure with sample data
BEGIN
    UpdateProperty(1, 1500, 3, 2);
END;
/

-- Execute the UpdateTenant stored procedure with sample data
BEGIN
    UpdateTenant(1, 'Michael Jordan', 'michie@email.com', '987-654-3210');
END;
/

-- Execute the UpdateLeaseContract stored procedure with sample data
BEGIN
    UpdateLeaseContract(1, SYSDATE - 15, SYSDATE + 350, 2);
END;
/

-- Execute the UpdatePropertyOwner stored procedure with sample data
BEGIN
    UpdatePropertyOwner(1, 'Emma Watson', 'emma@email.com', '123-456-7890');
END;
/

-- Execute the DeleteProperty stored procedure with sample data
BEGIN
    DeleteProperty(2);
END;
/

-- Execute the DeleteTenant stored procedure with sample data
BEGIN
    DeleteTenant(6);
END;
/

-- Execute the DeleteLeaseContract stored procedure with sample data
BEGIN
    DeleteLeaseContract(4);
END;
/

-- Execute the DeletePropertyOwner stored procedure with sample data
BEGIN
    DeletePropertyOwner(3);
END;
/


















//Drop all the tables once and insert the above sample values once again to all the tables to run the below query because some values of rows and tables might be affected due to the above storedprocedures of insert, delete and update operations.


 

//a. Join of Three or More Tables with Multiple Join Operations:
SELECT
    Property.PropertyID,
    Property.Address.City,
    Tenant.Name AS TenantName,
    LeaseContract.StartDate,
    LeaseContract.EndDate,
    PropertyOwner.Name AS OwnerName
FROM
    Property
JOIN LeaseContract ON Property.PropertyID = LeaseContract.PropertyID
LEFT JOIN Tenant ON LeaseContract.TenantID = Tenant.TenantID
LEFT JOIN PropertyOwner ON PropertyOwner.OwnerID = Property.PropertyID
WHERE
    Property.Type = 'Apartment';
    
    



    






//b. Query with UNION Operator:
SELECT
    TenantID,
    Name,
    'Tenant' AS UserType
FROM
    Tenant
UNION
SELECT
    OwnerID,
    Name,
    'PropertyOwner' AS UserType
FROM
    PropertyOwner;
    
    
    

    
    

//c. Query with Nested Table (Array in MongoDB):
SELECT
    p.PropertyID,
    p.Address.City,
    p.Bedrooms,
    p.Bathrooms,
    p.RentAmount,
    RTRIM(XMLAGG(XMLELEMENT(E, t.Name || ', ')).EXTRACT('//text()'), ', ') AS TenantNames
FROM
    Property p
LEFT JOIN LeaseContract lc ON p.PropertyID = lc.PropertyID
LEFT JOIN Tenant t ON lc.TenantID = t.TenantID
GROUP BY
    p.PropertyID,
    p.Address.City,
    p.Bedrooms,
    p.Bathrooms,
    p.RentAmount;




 
 
    
//d. Query Using Temporal Features:
SELECT
    LeaseContract.ContractID,
    LeaseContract.StartDate,
    LeaseContract.EndDate,
    Property.PropertyID,
    Property.Address.City,
    Property.RentAmount,
    Tenant.Name AS TenantName
FROM
    LeaseContract
JOIN Property ON LeaseContract.PropertyID = Property.PropertyID
LEFT JOIN Tenant ON LeaseContract.TenantID = Tenant.TenantID
WHERE
    SYSTIMESTAMP BETWEEN LeaseContract.StartDate AND LeaseContract.EndDate;







//e. Query Using OLAP Features (ROLLUP):

SELECT
    p.Address.City AS City,
    p.Type,
    SUM(p.RentAmount) AS TotalRent
FROM
    Property p
GROUP BY ROLLUP (p.Address.City, p.Type);












    
    


   
    
    


