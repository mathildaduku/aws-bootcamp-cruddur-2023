# Week 5 — DynamoDB and Serverless Caching

## Required Homework

- Plan out data modelling for application, specifically for the messages.

- Successfully outputted the dynamodb table by running schema load 

![](./assets/week-5/week-5-ddb-schema-load.png)

- Show list of tables and made it look nice

![](./assets/week-5/week-5-ddb-list-tables.png)

- Deleted dynamodb table

![](./assets/week-5/week-5-drop-ddb.png)

- If you have an if statement that doesnt require an else, always put an else that throws an error. It is good practice.

- Defined access patterns
- Built utility scripts for Dynamodb
- Implemented Conversations with Dynamodb
- Setup dynamodb stream in order to update our message group
- We created a dynamodb table on aws through our shell
- Created vpc endpoint for dynamodb
- Create lambda function to hook dynamodb
- Create message is working!!

### Watched Ashish's Week 5 - DynamoDB Considerations
The endpoint provided by amazon dynamodb is universal for that account i.e the URL is the same across each account but what would differ is the table youre trying to access

<b>Types of access to DynamoDB</b>

1. Internet gateway
2. VPC/Gateway Endpoints
3. DynamoDB Accelerator (DAX)
4. Cross Account roles

<b>Best practices - AWS</b>

1. Use VPC endpoints or private link option that allows you to have a private connection within the same AWS account. Use Amazon VPC to create a private network from your application or Lambda to a DynamoDB. This helps prevent unauthorized access to your instance from the public internet.

2. Compliance standard is what your business requires.

3. Amazon DynamoDB should only be in the AWS region that you are legally allowed to be holding user data in.

4. Amazon Organization SCP(Service Control Policy) - to manage DynamoDB Table deletion, DynamoDB creation, region lock etc

5. AWS Cloudtrail is enabled and monitored to trigger alerts on maicious DynamoDB behaviour by an identity in AWS.

6. AWS Config Rules (as no GuardDuty even in Mar 2023) is enabled in the account and region of DynamoDB.

<b>Best practices - Application</b>

1. DynamoDB to use appropriate Authentication - Use IAM roles/AWS cognito identity pool - Avoid IAM Users/Groups. Becasue you want temporary credentials that will stop working after a certain period of time.

2. DynamoDB Lifecycle Management - Create, Modify, Delete Users. Make sure there are limited no. of users and the users should have minimum permisions.

3. AWS IAM roles instead of individual users to access and manage DynamoDB.

4. DAX Service (IAM) Role to have Read Only Access to DynamoDB (if possible).

5. Not have DynamoDB be accessed from the internet (use VPC Endpoints etc)

6. Site to Site VPN or Direct Connnect for Onpremise and DynamoDB Access.

7. Client side encryption is recommended by Amazon for DynamoDB. Dont use DynamoDB to store sensitive information. Use relational DBs to store sensitive information for long term storage. DynamoDB are more for fast reaction. 

