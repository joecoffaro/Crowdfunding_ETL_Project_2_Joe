--Create a database named '''crowdfunding_db''' using SQL

CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Table creation exported from QuickDBD: https://www.quickdatabasediagrams.com/
----Table creation of "contacts"
CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);
----SELECT query to verify table creation of "contacts"
SELECT * FROM information_schema.tables
WHERE table_name = 'contacts';


----Table creation of "category"
CREATE TABLE "category" (
    "category_id" varchar(4)   NOT NULL,
    "category" varchar(12)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);
----SELECT query to verify table creation of "category"
SELECT * FROM information_schema.tables
WHERE table_name = 'category';


----Table creation of "subcategory"
CREATE TABLE "subcategory" (
    "subcategory_id" varchar(8)   NOT NULL,
    "subcategory" varchar(17)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);
----SELECT query to verify table creation of "subcategory"
SELECT * FROM information_schema.tables
WHERE table_name = 'subcategory';


----Table creation of "campaign"
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(10)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(2)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(4)   NOT NULL,
    "subcategory_id" varchar(12)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id","contact_id"
     )
);
----SELECT query to verify table creation of "campaign"
SELECT * FROM information_schema.tables
WHERE table_name = 'campaign';


----Addition of Foreign Key constraints
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");


----SELECT queries to display the four tables created above
SELECT * FROM contacts;
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM campaign;

----NOTE: When importing the CSV files to create a Postgres DB, import the files according to 
----  the table creation order in the code above to avoid any import errors.
