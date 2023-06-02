# Week 6 — Deploying Containers


Types of container service in Aws
1. Virtual machine - hosting a container on an actual server 
2. ECS, Fargate, EKS - managed container service on aws

Types of launch types to AWS
1. Amazon EC2 Architecture : If you have an EC2 instance where you want to deploy containers, you would have an auto scaling group which would help scale it up and down, you would also have a load balancer(elastic load balancer) in the the front. This load balancer would distribute traffic across the different ec2 instances(which would have containers within them im guessing) 
2. Amazon ECS Architecture : you would still have the load balancer in the front BUT what you’re talking to is the ECS cluster. The ECS cluster can have a lot of EC2 instances that itself is managing .
So the cluster is managing the EC2 instances, you create a cluster and all the services within the cluster are managed by the ECS cluster while in the EC2 architecture, you’re managing the ec2 instances yourself, you’re deploying, you’re scaling up and scaling down 

![image](https://github.com/mathildaduku/aws-bootcamp-cruddur-2023/assets/104989791/82b44c91-4538-45bc-b8e6-a3b0a149eb67)


3. ECS Fargate: It is used to deploy serverless container. You don’t have control over anything you don’t see the ec2 instances, you just basically see tasks running and Amazon manages the ec2 instances, the cluster, the service. You just define the tasks and IAM role. 

What’s the difference between ecs and ecs Fargate? What do you have control over ?


Fargate is a serverless compute solution. So it enables you to focus on container-level tasks, such as setting access controls and resource parameters, instead of more time-consuming tasks, like provisioning, setting up, updating, securing, and scaling clusters of Elastic Compute Cloud (EC2) servers or virtual machines. You don’t need to choose the right server types, manually scale instances, or patch many issues. AWS handles that on your behalf. Your primary focus is optimizing your code for optimal service delivery. This increases productivity, eases management, and optimizes operational costs.

Shared Risks with AWS ECS 

Traditional EC2 Instances 
User manages 
1. Containerized applications
2. Container runtime 
3. Storage, loggings, monitoring plugins
4. Operating system 
AWS manages 
1. Virtual machine 
2. Physical server 

AWS Fargate
User manages 
1. Containerized Applications
AWS manages 
1. Container runtime
2. Storage, loggings, monitoring plugins 
3. Operating system
4. Virtual machine
5. Physical server 

Security challenges with ECS Fargate
- [ ] No Visibility of infrastructure 
- [ ] Ephemeral Resources make it hard to do triage or forensics for detected threats 
- [ ] No file or network monitoring 
- [ ] Cannot run traditional security agents in Fargate 
- [ ] User cannot run unverified container images 
- [ ] Containers can run and root and even with elevated privileges 

Amazon ECS - Security Best Practices - AWS

1. Cloud control plane configuration - Access Control, Container images, etc
2. Choosing the right public or private ECR for images 
3. Amazon ECR Scan Images to “Scan on Push” using Basic or enhanced (Inspector + Snyk)
4. Use VPC endpoints or security groups with known sources only 
5. Compliance standard is what your business requires 
6. Amazon Organization SCP -create restrictions to manage ECS task deletion, ECS creation, region lock etc
7. Aws cloud trail is enabled and configured to trigger alerts on malicious ECS behavior by an identity in AWS
8. Aws config rules (as no guard duty (ECS) even in march 2023) is enabled in the account and region of ECS.


Amazon ECS - Security Best Practices - Application 

1. Access control - Roles or IAM user for ECS clusters, services or tasks
2. Most recent version of ECR Agent daemon on EC2 
3. Container control plane configuration - root privileges, resource limitations, etc
4. No secrets/passwords in ECS task definitions e.g database password, etc consider AWS secret manager 
5. No secrets or passwords in container, consider AWS secret manager 
6. Only use trusted containers from ECR with no high or critical vulnerabilities 
7. Limit ability to SSH into EC2 container to read only file systems - use API or GitOps to pull information for troubleshooting 
8. Amazon cloud watch to monitor malicious ECS configuration changes 
9. Only use authorized container images 


We can deploy containers to- 
1. Lambda 
2. App runner
3. Elastic beanstalk 
4. ECS Fargate 
5. ECS EC2
6. Kubernetes 
