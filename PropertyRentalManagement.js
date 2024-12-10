
//Dropping the collections
db.Property.drop();
db.Tenant.drop();
db.LeaseContract.drop();
db.PropertyOwner.drop();


















// Create Property collection
db.createCollection("Property");
// Create Tenant collection
db.createCollection("Tenant");
// Create LeaseContract collection
db.createCollection("LeaseContract");
// Create PropertyOwner collection
db.createCollection("PropertyOwner");


// Insert sample data into Property collection
db.Property.insertMany([
    {
        PropertyID: 1,
        Address: { Street: '456 Oak St', City: 'Townsville', State: 'CA', ZipCode: '90345' },
        Type: 'House',
        Bedrooms: 3,
        Bathrooms: 2,
        RentAmount: 2000
    },
    {
        PropertyID: 2,
        Address: { Street: '789 Pine St', City: 'Villageton', State: 'CA', ZipCode: '90456' },
        Type: 'Condo',
        Bedrooms: 1,
        Bathrooms: 1,
        RentAmount: 1200
    },
    {
        PropertyID: 3,
        Address: { Street: '101 Cedar St', City: 'Hamletville', State: 'CA', ZipCode: '90567' },
        Type: 'Apartment',
        Bedrooms: 2,
        Bathrooms: 1,
        RentAmount: 1500
    },
    {
        PropertyID: 4,
        Address: { Street: '202 Maple St', City: 'Suburbia', State: 'CA', ZipCode: '90678' },
        Type: 'House',
        Bedrooms: 4,
        Bathrooms: 3,
        RentAmount: 2500
    },
    {
        PropertyID: 5,
        Address: { Street: '303 Elm St', City: 'Ruralville', State: 'CA', ZipCode: '90789' },
        Type: 'Condo',
        Bedrooms: 2,
        Bathrooms: 2,
        RentAmount: 1800
    },
    {
        PropertyID: 6,
        Address: { Street: '404 Birch St', City: 'Countryside', State: 'CA', ZipCode: '90890' },
        Type: 'House',
        Bedrooms: 3,
        Bathrooms: 2,
        RentAmount: 2100
    },
    {
        PropertyID: 7,
        Address: { Street: '505 Walnut St', City: 'Mountainview', State: 'CA', ZipCode: '90901' },
        Type: 'Condo',
        Bedrooms: 1,
        Bathrooms: 1,
        RentAmount: 1300
    },
    {
        PropertyID: 8,
        Address: { Street: '606 Pineapple St', City: 'Seasidetown', State: 'CA', ZipCode: '91012' },
        Type: 'Apartment',
        Bedrooms: 2,
        Bathrooms: 1,
        RentAmount: 1600
    }
]);

db.Property.find();



// Insert sample data into Tenant collection
db.Tenant.insertMany([
    {
        TenantID: 1,
        Name: 'Rojan Shrestha',
        ContactInfo: { Email: 'rojan@email.com', Phone: '987-654-3210' }
    },
    {
        TenantID: 2,
        Name: 'Anuj Poudel',
        ContactInfo: { Email: 'anup@email.com', Phone: '234-567-8901' }
    },
    {
        TenantID: 3,
        Name: 'Aashika Ghimire',
        ContactInfo: { Email: 'aashika@email.com', Phone: '345-678-9012' }
    },
    {
        TenantID: 4,
        Name: 'Aashirwad Acharya',
        ContactInfo: { Email: 'aashir@email.com', Phone: '456-789-0123' }
    },
    {
        TenantID: 5,
        Name: 'Cristiano Ronaldo',
        ContactInfo: { Email: 'cristiano@email.com', Phone: '567-890-1234' }
    },
    {
        TenantID: 6,
        Name: 'Virat Kohli',
        ContactInfo: { Email: 'viru@email.com', Phone: '678-901-2345' }
    },
    {
        TenantID: 7,
        Name: 'Harry Kane',
        ContactInfo: { Email: 'harry@email.com', Phone: '789-012-3456' }
    },
    {
        TenantID: 8,
        Name: 'Eoin Morgan',
        ContactInfo: { Email: 'eoin@email.com', Phone: '890-123-4567' }
    }
]);

db.Tenant.find();



// Insert sample data into LeaseContract collection
db.LeaseContract.insertMany([
    {
        ContractID: 1,
        LeaseInfo: { ContractID: 2, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 1,
        TenantID: 1,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 2,
        LeaseInfo: { ContractID: 3, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 2,
        TenantID: 2,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 3,
        LeaseInfo: { ContractID: 4, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 3,
        TenantID: 3,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 4,
        LeaseInfo: { ContractID: 5, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 4,
        TenantID: 4,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 5,
        LeaseInfo: { ContractID: 6, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 5,
        TenantID: 5,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 6,
        LeaseInfo: { ContractID: 7, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 6,
        TenantID: 6,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 7,
        LeaseInfo: { ContractID: 8, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 7,
        TenantID: 7,
        StartDate: new Date(),
        EndDate: new Date() + 365
    },
    {
        ContractID: 8,
        LeaseInfo: { ContractID: 9, StartDate: new Date(), EndDate: new Date() + 365 },
        PropertyID: 8,
        TenantID: 8,
        StartDate: new Date(),
        EndDate: new Date() + 365
    }
]);

db.LeaseContract.find();






// Insert sample data into PropertyOwner collection
db.PropertyOwner.insertMany([
    {
        OwnerID: 1,
        Name: 'Sachin Tendulkar',
        ContactInfo: { Email: 'sachin@email.com', Phone: '987-654-3210' },
        TenantID: 1
    },
    {
        OwnerID: 2,
        Name: 'Kobe Bryant',
        ContactInfo: { Email: 'kobe@email.com', Phone: '234-567-8901' },
        TenantID: 2
    },
    {
        OwnerID: 3,
        Name: 'Jude Bellingham',
        ContactInfo: { Email: 'jude@email.com', Phone: '345-678-9012' },
        TenantID: 3
    },
    {
        OwnerID: 4,
        Name: 'Michael Corleone',
        ContactInfo: { Email: 'michael@email.com', Phone: '456-789-0123' },
        TenantID: 4
    },
    {
        OwnerID: 5,
        Name: 'Bukayo Saka',
        ContactInfo: { Email: 'bukay@email.com', Phone: '567-890-1234' },
        TenantID: 5
    },
    {
        OwnerID: 6,
        Name: 'Martin Luther',
        ContactInfo: { Email: 'luther@email.com', Phone: '678-901-2345' },
        TenantID: 6
    },
    {
        OwnerID: 7,
        Name: 'John Cena',
        ContactInfo: { Email: 'john@email.com', Phone: '789-012-3456' },
        TenantID: 7
    },
    {
        OwnerID: 8,
        Name: 'Toni Kroos',
        ContactInfo: { Email: 'toni@email.com', Phone: '890-123-4567' },
        TenantID: 8
    }
]);



db.PropertyOwner.find();




// Update operations on Property collection
db.Property.updateOne({ PropertyID: 8 }, { $set: { RentAmount: 1800 } });
db.Property.updateOne({ PropertyID: 3 }, { $set: { Bedrooms: 3, Bathrooms: 2 } });

// Update operations on Tenant collection
db.Tenant.updateOne({ TenantID: 1 }, { $set: { Name: 'Luka Modric' } });
db.Tenant.updateOne({ TenantID: 2 }, { $set: { ContactInfo: { Email: 'lukita@email.com', Phone: '987-654-3210' } } });

// Update operations on LeaseContract collection
db.LeaseContract.updateOne({ ContractID: 7 }, { $set: { StartDate: new Date() - 30 * 24 * 60 * 60 * 1000, EndDate: new Date() + 335 * 24 * 60 * 60 * 1000 } });
db.LeaseContract.updateOne({ ContractID: 2 }, { $set: { TenantID: 1 } });

// Update operations on PropertyOwner collection
db.PropertyOwner.updateOne({ OwnerID: 6 }, { $set: { Name: 'Sergio Ramos' } });
db.PropertyOwner.updateOne({ OwnerID: 5 }, { $set: { ContactInfo: { Email: 'sramos@email.com', Phone: '987-654-3210' } } });

// Delete operations on LeaseContract collection
db.LeaseContract.deleteOne({ TenantID: 4 });

// Delete operations on PropertyOwner collection
db.PropertyOwner.deleteOne({ OwnerID: 2 });




//Drop all the collections once and insert the above documents once again to all the collection to run the below query because some values of documents and collections might be affected due to the above delete and update operations. 

//a.Use of three or more tables using multiple join operations
db.Property.aggregate([
    {
        $match: { Type: 'Apartment' }
    },
    {
        $lookup: {
            from: 'LeaseContract',
            localField: 'PropertyID',
            foreignField: 'PropertyID',
            as: 'leaseContracts'
        }
    },
    {
        $unwind: '$leaseContracts'
    },
    {
        $lookup: {
            from: 'Tenant',
            localField: 'leaseContracts.TenantID',
            foreignField: 'OwnerID',
            as: 'tenant'
        }
    },
    {
        $lookup: {
            from: 'PropertyOwner',
            localField: 'PropertyID',
            foreignField: 'TenantID',
            as: 'propertyOwner'
        }
    },
    {
        $project: {
            'PropertyID': 1,
            'Address.City': 1,
            'TenantName': '$tenant.Name',
            'StartDate': '$leaseContracts.StartDate',
            'EndDate': '$leaseContracts.EndDate',
            'OwnerName': '$propertyOwner.Name'
        }
    }
]);



//b.Query with Union Operator
db.Tenant.aggregate([
    {
        $project: {
            _id: 0,
            UserID: "$TenantID",
            Name: 1,
            UserType: "Tenant"
        }
    },
    {
        $unionWith: {
            coll: "PropertyOwner",
            pipeline: [
                {
                    $project: {
                        _id: 0,
                        UserID: "$OwnerID",
                        Name: 1,
                        UserType: "PropertyOwner"
                    }
                }
            ]
        }
    }
])





//c.Query Using Nested Table(Array in MongoDb)
db.Property.aggregate([
    {
        $lookup: {
            from: "LeaseContract",
            localField: "PropertyID",
            foreignField: "PropertyID",
            as: "leases"
        }
    },
    {
        $unwind: "$leases"
    },
    {
        $lookup: {
            from: "Tenant",
            localField: "leases.TenantID",
            foreignField: "TenantID",
            as: "tenants"
        }
    },
    {
        $group: {
            _id: {
                PropertyID: "$PropertyID",
                City: "$Address.City",
                Bedrooms: "$Bedrooms",
                Bathrooms: "$Bathrooms",
                RentAmount: "$RentAmount"
            },
            TenantNames: {
                $addToSet: "$tenants.Name" // Store tenant names as an array
            }
        }
    },
    {
        $project: {
            _id: 0,
            PropertyID: "$_id.PropertyID",
            "Address.City": "$_id.City",
            Bedrooms: "$_id.Bedrooms",
            Bathrooms: "$_id.Bathrooms",
            RentAmount: "$_id.RentAmount",
            TenantNames: {
                $reduce: {
                    input: "$TenantNames",
                    initialValue: [],
                    in: { $concatArrays: ["$$value", "$$this"] }
                }
            }
        }
    }
]);





//d.Query using temporal features
db.LeaseContract.aggregate([
    {
        $lookup: {
            from: "Property",
            localField: "PropertyID",
            foreignField: "PropertyID",
            as: "property"
        }
    },
    {
        $unwind: "$property"
    },
    {
        $lookup: {
            from: "Tenant",
            localField: "TenantID",
            foreignField: "TenantID",
            as: "tenant"
        }
    },
    {
        $unwind: {
            path: "$tenant",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $addFields: {
            currentDate: new Date()
        }
    },
    {
        $match: {
            $expr: {
                $and: [
                    { $lte: ["$StartDate", "$currentDate"] },
                    { $gte: ["$EndDate", "$currentDate+365"] }
                ]
            }
        }
    },
    {
        $project: {
            _id: 0,
            ContractID: 1,
            StartDate: 1,
            EndDate: 1,
            "property.PropertyID": 1,
            "property.Address.City": 1,
            "property.RentAmount": 1,
            TenantName: { $ifNull: ["$tenant.Name", null] }
        }
    }
])






//e.Query using OLAP features(RollUp)
db.Property.aggregate([
    {
        $group: {
            _id: {
                City: "$Address.City",
                Type: "$Type"
            },
            TotalRent: { $sum: "$RentAmount" }
        }
    },
    {
        $group: {
            _id: {
                City: "$_id.City",
                Type: "$_id.Type"
            },
            TotalRent: { $sum: "$TotalRent" }
        }
    },
    {
        $group: {
            _id: {
                City: "$_id.City",
                Type: null
            },
            Types: {
                $push: {
                    Type: "$_id.Type",
                    TotalRent: "$TotalRent"
                }
            },
            TotalRent: { $sum: "$TotalRent" }
        }
    },
    {
        $project: {
            _id: 0,
            City: "$_id.City",
            Types: {
                $cond: {
                    if: { $eq: ["$Types", [null]] },
                    then: [],
                    else: "$Types"
                }
            },
            TotalRent: 1
        }
    }
]);


















