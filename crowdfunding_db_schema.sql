-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dlKkBe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

SELECT * FROM campaign;
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"));




CREATE TABLE "category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);
Drop table backers;
Select * from backers;
CREATE TABLE "backers" (
	"backer_id" varchar NOT NULL,
	"cf_id" int NOT NULL,
	"first_name" varchar(50) NOT NULL,
	"last_name" varchar(50) NOT NULL,
	"email" varchar (100) NOT NULL,
    CONSTRAINT "pk_backers" PRIMARY KEY (
        "backer_id"
     )
);



ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY("cf_id")
REFERENCES "campaign" ("cf_id");
ABORT


--A SQL query is written and successfully executed that retrieves the number of backer_counts in descending order for each 
--cf_id and for all the live campaigns. (2.5 pt)
SELECT backers_count, cf_id, outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;
-----------------------------

----------------------
SELECT backers_count, cf_id, outcome, pledged, goal
INTO live
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;
DROP TABLE live
SELECT * FROM live;



SELECT cf_id, goal, pledged,(goal - pledged) 
As remaining_amount 
into live2
FROM live;
SELECT * FROM remaining_amount



SELECT
bi.first_name, 
bi.last_name, 
bi.email,
lj.cf_id, outcome, goal, pledged, (goal - pledged)
As remaining_amount 
INTO email_contacts_remaining_goal_amount
FROM live as lj
WHERE outcome = 'live';
INNER JOIN backers as bi
ON lj.cf_id = bi.cf_id
drop table email_contacts_remaining_goal_amount;
SELECT*FROM email_contacts_remaining_goal_amount;

SELECT first_name, last_name, email, remaining_amount
Into remaining___amount
FROM email_contacts_remaining_goal_amount 

SELECT * FROM remaining___amount;




SELECT*FROM lt.cf_id, lt.remaining_amount,
bi.first_name, 
bi.last_name, 
bi.email
INTO email_contacts_remaining_goal_amount
FROM live2 as lt
INNER JOIN backers as bi
ON lt.cf_id = bi.cf_idcts_remaining_goal_amount;



------2
SELECT li.cf_id,
li.outcome,
li.pledged,
li.goal, 
bi.first_name, 
bi.last_name, 
bi.email
INTO email_contacts_remaining_goal_amount
FROM live as li
INNER JOIN backers as bi
ON li.cf_id = bi.cf_id

SELECT * from email_contacts_remaining_goal_amount;
Drop table email_contacts_remaining_goal_amount
