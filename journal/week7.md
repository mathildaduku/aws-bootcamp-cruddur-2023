# Week 7 — Solving CORS with a Load Balancer and Custom Domain

## Watched Ashish video on Route 53 and Domains

### Business use cases for route 53

1. Deploy an application to the public internet with a custom domain
Uplift security to prevent most common security attacks as OWASP Top Ten

2. Integration with Acm (Amazon certificate manager) for tls

<b>Amazon Route 53 - Security Best Practices - AWS</b>

1. Compliance standard is what your business requires for a DNS provider

2. Amazon Organizations SCP - to manage Route53 actions like creation, deletion, modification of production URIs etc

3. AWS CloudTrail is enabled & monitored to trigger alerts for malicious activities e.g Associate VPC with Hosted Zone, Change Resource Record Sets, Register Domain etc

4. GuardDuty is enabled for monitoring suspicious DNS comms (e.g Crypto-mining etc) and automated for auto-remediation.
5. AWS Config Rules is enabled in the account and region of ECS

<b>Amazon Route 53 - Security Best Practices - Application</b>

1. Access Control - Roles or IAM Users for making DNS changes in Amazon Route53.
2. Public vs Private Hosted Zones
3. All Route53 records should point to an existing DNS, ELB, ALB or AWS S3. Watch Out for Dangling DNS domains
4. Hosted Zone Configuration Changes limited to small set of people.
5. Enable Encryption in Transit using TLS/SSL certification e.g HTTPS Urls.
6. Only use Trusted Domain Providers for requesting new DNSs.
7. Set TTLs appropriately to afford to wait for a change to take effect
8. Ensure Root Domain Alias Record Points to ELB
9. Develop process for continuously verifying if DNS (& Hosted Zone) are all current and valid.