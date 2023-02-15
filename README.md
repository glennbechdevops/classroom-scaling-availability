# GOAL 

In this exercise we will 

* How to write- and run load tests using the K6 load test tool 
* Inspect and look at containers running in a load balanced environment in AWS
* Test robustness of a system with a single running system- by removing processes while performing tests 
* Add more processes to the load balanced environment and see that the system is resilient to a failure in one of the processes

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
git clone https://github.com/glennbechdevops/unleash-feature-management
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


