# Real Estate Management System (Oracle & MongoDB)

This project is a **Real Estate Management System** that integrates **Oracle SQL** and **MongoDB** to handle both structured and unstructured data in a real estate environment. The system is designed to manage properties, tenants, lease contracts, and property owners with robust database management techniques. It leverages the strengths of both **relational (Oracle)** and **NoSQL (MongoDB)** databases for optimized data handling.

## Features

- **Property Management**: Store and manage property details including address, type, number of bedrooms, bathrooms, and rent amount.
- **Tenant Management**: Maintain tenant information including contact details.
- **Lease Contracts**: Store and manage lease contracts between properties and tenants, including lease start and end dates.
- **Property Ownership**: Maintain property owner information and their associated tenants.
- **Hybrid Database Design**:
  - **Oracle** for structured data, ensuring ACID compliance for transactional operations.
  - **MongoDB** for flexible, unstructured data storage, enabling complex aggregation and reporting.

## Technologies Used

- **Databases**:
  - **Oracle SQL** for transactional data (Property, Tenant, LeaseContract, PropertyOwner)
  - **MongoDB** for unstructured data (Tenant history, Property images, Metadata)
  
- **Programming Languages**:
  - **SQL** for querying and managing Oracle data
  - **JavaScript** (MongoDB Shell) for MongoDB operations

- **Tools**:
  - **MongoDB Compass** for database management and queries
  - **Oracle SQL Developer** for Oracle database management

## Project Structure

- `Property` Collection (MongoDB)
  - Stores property details (e.g., address, type, rent amount)
  
- `Tenant` Collection (MongoDB)
  - Stores tenant details (e.g., name, contact information)
  
- `LeaseContract` Collection (MongoDB)
  - Stores lease contract information (e.g., start date, end date, tenant ID, property ID)
  
- `PropertyOwner` Collection (MongoDB)
  - Stores property owner information (e.g., name, contact details)

## Key Features

### 1. **Hybrid Database Architecture**
The system uses **Oracle** for managing structured relational data and **MongoDB** for flexible and scalable storage of unstructured data. This combination ensures that the project leverages the strengths of both relational and NoSQL databases.

### 2. **Data Synchronization**
APIs and scripts were created to synchronize data between Oracle and MongoDB to ensure consistency and real-time updates across both systems.

### 3. **Advanced Reporting & Analytics**
The Oracle database handles complex queries for generating reports related to rent, contracts, and lease expirations, while MongoDB is used for aggregating trends and analysis of unstructured data.

### 4. **Optimized Performance**
The hybrid architecture provides high-performance capabilities for managing large volumes of both structured and unstructured data.

## Getting Started

### Prerequisites

- **Oracle Database**: Set up an Oracle database to manage structured data.
- **MongoDB**: Set up a MongoDB instance to handle unstructured data.
- **Node.js** (Optional): If you want to implement API-based synchronization between Oracle and MongoDB.

### Installation

1. **Clone this repository**:

   ```bash
   git clone https://github.com/abhiisap/real-estate-management-system.git
   cd real-estate-management-system
Set up the Oracle Database:
Follow the instructions to create tables and insert sample data in Oracle.
Set up MongoDB:
Create collections in MongoDB for Property, Tenant, LeaseContract, and PropertyOwner.
Run the Project:
You can run the MongoDB and Oracle scripts provided in the repository to set up the database.
Use MongoDB Compass and Oracle SQL Developer to manage and query your databases.
