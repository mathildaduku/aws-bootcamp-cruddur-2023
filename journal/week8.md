# Week 8 — Serverless Image Processing

## Required Homework

### Implement CDK Stack

<b>AWS CDK - Cloud Development Kit :</b>
It is an infrastructure as code tool, you can define your cloud resources in your programming language of choice e.g python, java, typescript,etc unlike cloud formation where you define your infrastructure using YAML or JSON. You can contribute to it via open source. CDK minimizes the amount of cloud formation template code you have.

- CDK is a great tool to use with serverless.

- CDK works well with other tools even other IAC tools, e.g AWS Serverless Application Module (SAM), terraform, kubernetes, AWS lambda, AWS API gateway.

- We created resources for 
1. An S3 bucket
2. A Lamda function that is going to process the image and some of these interactions with our API and a webhook

<b>Use cases for Level constructs in CDK:</b>

- If you have an idea of what you want to do and you need to play around with other things you'd probably want to stick closer to a Level 1(L1) construct, if you have a lot of customizations you're going to do.

- If its something more generalized, you might want ot get started with something that already exists, so youd want to use the Level 3(L3) construct.

- The Level 2 construct kind of takes your primitive CFN(Cloud formation) like your Amazon S3 bucket construct and adds a little more customization to it and allows you to play a round with a little more of the parameters, its like a little bit of a step up from the cloud formation resource construct, and you will be able to tell the difference between them because the L1 constructs uses a CFN bucket and then the L2 constructs will be just like your S3 bucket.

- The ones with CFN in the dropdown are level ones, we are using the level twos.  A lot of the constructs in the API reference in the documentaion are L2 constructs.

The code below creates the bucket-
```typescript
  createBucket(bucketName: string): s3.IBucket {
    const bucket = new s3.Bucket(this, 'ThumbingBucket', {
      bucketName: bucketName,
      removalPolicy: cdk.RemovalPolicy.DESTROY
    });
    return bucket;
  }
```

- "this" - Its saying the scope of your project is this

- ThumbingBucket - logical id that can help you identify your resources in the console sort of like a friendly name

- props - properties of the bucket that you want to define or create or utilize. For every resource there is going to be at least one property that is required. While there are ones that are optional that you just want to add on.

- You have to explicitly give the resources permision or denials to make sure that you are scoped correctly to what you are working with

- s3.IBucket: its best practice to identity what the return type is

- Ibucket- I stands for interface. An interface in typescript is a way of collecting a bunch of parameters as an object. It's a ways of passing complex types. In typescript they are often used to explicitly pass in named parameters. Named parameters are when you actually name what the parameter is when you pass them in so you explicitly know what it is there, since name parameters dont exist in typescript.

<b>What is bootstrapping? </b>

- Bootstrapping is the process of provisioning resources for the AWS CDK before you can deploy AWS CDK apps into an AWS environment. (An AWS environment is a combination of an AWS account and Region).

- These resources include an Amazon S3 bucket for storing files and IAM roles that grant permissions needed to perform deployments.

- The required resources are defined in an AWS CloudFormation stack, called the bootstrap stack, which is usually named CDKToolkit. Like any AWS CloudFormation stack, it appears in the AWS CloudFormation console once it has been deployed.

- Environments are independent. If you want to deploy to multiple environments (different AWS accounts or different Regions in the same account), each environment must be bootstrapped separately.


- You need to bootstrap your account so aws knows that you are provisioning resources with aws cdk. If you try to do a cdk deploy, its not going to pass its going to error out because your stack is not bootstrapped.

- Bootstrapping is done ONCE per your account, you dont have to do it for every project you are in. You have to bootstap your accounts if you are using multiple regions

``` bash
cdk bootstrap "aws//1234567012/us-east-1"
```

![](./assets/week-7+8-s3-bucket-avatar.png)

### Serve Avatars via CloudFront	

![](./assets/week-7+8-avatar-upload.png)


### Implement Users Profile Page	

![](./assets/week-7+8-edit-profile.png)

### Implement Backend Migrations	
Implement migrations and rollback

### Presigned URL generation via Ruby Lambda	
### HTTP API Gateway with Lambda Authorizer	
### Create JWT Lambda Layer	
### Render Avatars in App via CloudFront
