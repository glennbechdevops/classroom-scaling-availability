# GOAL 

The goal of this task is to gain hands-on experience with ELB and ECS, and to understand the benefits and tradeoffs of using this combination for scalable and resilient containerized workloads on AWS.

We will look into 

* Elastic Load Balancing (ELB) is an AWS service that automatically distributes incoming application traffic across multiple targets, such as EC2 instances, containers, and IP addresses, in one or more Availability Zones.
* Amazon Elastic Container Service (ECS) is a fully-managed container orchestration service that makes it easy to run, stop, and manage Docker containers on a cluster of EC2 instances.
* Using ECS with ELB can help ensure high availability, scalability, and fault tolerance for containerized applications running on AWS.
* The task at hand is to explore and test the use of ELB with ECS to distribute traffic to multiple containers running in a cluster.
* This will involve inspecting an existing  ECS cluster, and testing the load balancing behavior using various the K6 load test framework. 
* How to write- and run load tests using the K6 load test tool


## Log in to your AWS Cloud9  environment

Go to the AWS Management Console (https://244530008913.signin.aws.amazon.com/console)

* Enter your username (the first part of your email address, before the @ symbol) and the password provided in class.
* Click on the "Sign In" button.
* Once you are logged in, you will be directed to the AWS Management Console home page.
* In the top left corner, you will see a navigation menu. Click on the "Services" button.
* In the services menu, look for the "Cloud9" service.
* Click on the Cloud9 service to open the Cloud9 dashboard.
* You will now be able to see the list of environments that you have access to.
* Select your environment
* Familiarize yourself with Cloud9 by exploring and experimenting with the platform.

## No auto save!

The number #1 problem for most students using Cloud9 is that they forget to explicitly save files  - as there is no auto save!

## Clone this repo

Clone this repository into your cloud 9 environment. Use the Terminal on the bottom of the screen in your cloud 9 environment

```text
git clone https://github.com/glennbechdevops/scaling-availability
```

## Inspect your load balancer 

* Navigate to EC2 

## Inspect the ECS service 

* Navigate to ECS 

## Run load tests against your own load balancer

Modify the file and change the URL
Run the load test by

## Extend the duration of the load test

Modify the load test duration
Run the load test

## Remove a task while the test is running 

* Navigate to ECS 
* Find your service 
* Select "Tasks"
* Pick the single task and stop it. 

## Observe that the load tests contain failures

## Add another tasks to the Service 

* Modify service 
* Set maximum- and desired tasks both to 2

## Re 


