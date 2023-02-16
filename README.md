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

## Inspect your load balancer and ECS cluster 

Important! Please make sure you have checked the "New ECS Experience" checkbox before following instructions. 

![alt text](images/newexperience.png "New Experience")

* Open the AWS Management Console in your web browser.
* Navigate to the "Elastic Container Service" service using the search bar or by selecting it from the list of services.
* From the ECS dashboard, locate your ECS cluster by selecting it from the list of clusters. It should have your name or a name that you have assigned to it.
* From the cluster view, select the service with your name on it. You should see one active task running (container) in the service detail page.
* Under the "Tasks" tab, verify that the task status is "RUNNING".
* In the same service detail page, look under the  "Load Balancing" section and under "load balancer name", you should see a link to your Load Balancer.
* Click on the Load Balancer link to view the load balancer configuration and verify that it is correctly routing traffic to your ECS service.
* Verify by copy/pasting the load balancer domain name into your browser 

## Run load tests against your own load balancer

* In your cloud9 environment, locate the file called ~/environment/scaling-availability/k6/simpletest.js
* Modify the statement ```http.get("");``` and insert your load balancer domain name, prefixed with ```http://``` example: http://glennbech-alb-12121212.eu-west-1.elb.amazonaws.com
* Run a simple load test against your ECS service 

```shell
 docker run --rm -i grafana/k6 run --vus 10 --duration 30s - <simpletest.js
```
* vus are "virtual users" or concurrent threads 
* duration is as you might expect, how long the test will run 

## Extend the duration of the load test

Run another test for 10 minutes 
```shell
 docker run --rm -i grafana/k6 run --vus 10 --duration 10m - <simpletest.js
```

## Stop  a task while the test is running 

* From the ECS dashboard, select the cluster that your task is running on by clicking on its name.
* Under the "Tasks" tab, find the single running task and select the checkbox next to it.
* Click on the "Stop" Drop down located above the task list. chose "Stop selected"
* In the confirmation dialog box, review the details of the task and click the "Stop" button to stop the task.
* Wait for a few seconds for the task to stop, and then verify that its status has changed to "STOPPED". You can refresh the page to update the status.

## Observe that the load tests contain failures

Your report might look something like this 

```shell
     data_received..................: 1.5 MB 5.1 kB/s
     data_sent......................: 375 kB 1.2 kB/s
     http_req_blocked...............: avg=83.28µs min=3.81µs   med=5.08µs  max=25.76ms  p(90)=10.17µs  p(95)=11.95µs 
     http_req_connecting............: avg=19.33µs min=0s       med=0s      max=8.83ms   p(90)=0s       p(95)=0s      
     http_req_duration..............: avg=1.76ms  min=447.42µs med=1.75ms  max=15.4ms   p(90)=2.74ms   p(95)=3.04ms  
       { expected_response:true }...: avg=2.33ms  min=1.3ms    med=2.23ms  max=9.62ms   p(90)=2.94ms   p(95)=3.21ms  
     http_req_failed................: 45.10% ✓ 1353     ✗ 1647
     http_req_receiving.............: avg=40.79µs min=18.12µs  med=30.16µs max=433.33µs p(90)=67.57µs  p(95)=88.04µs 
     http_req_sending...............: avg=49.4µs  min=9.03µs   med=14.87µs max=933.9µs  p(90)=109.55µs p(95)=320.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s      
     http_req_waiting...............: avg=1.67ms  min=405.66µs med=1.67ms  max=15.32ms  p(90)=2.61ms   p(95)=2.88ms  
     http_reqs......................: 3000   9.972239/s
     iteration_duration.............: avg=1s      min=1s       med=1s      max=1.02s    p(90)=1s       p(95)=1s      
     iterations.....................: 3000   9.972239/s
     vus............................: 10     min=10     max=10
     vus_max........................: 10     min=10     max=10
```

* Observe that the errors under ```http_req_failed```
## Increase the desired task count 

* From the ECS dashboard, select the cluster that your service is running on by clicking on its name.
* Under the "Services" tab, find the service that you want to update and click on its name to view its details.
* In the service detail page, click on the "Update Service" button to modify the service configuration.
* In the "Desired tasks" field, enter the desired number of tasks (2) that you want to run for the service. You can set this value between the minimum and maximum value specified in the service capacity settings.
* Oce you have made the desired changes, review the configuration details and click the "Update" button to save the changes.
* Wait for a few seconds for the service to update, and then verify that the desired number of tasks are running as expected. You can check the service status and the tasks' status in the ECS dashboard.

## Re-start load tests 

From your Cloud9 environment, run another test for 10 minutes
```shell
 docker run --rm -i grafana/k6 run --vus 10 --duration 10m - <simpletest.js
```

## Stop as single task to simulate a failure

By following the previous given instructions on how to stop a task, do exactly that. 
Make sure not to stop both of them!

Also notice that there will another task started very shortly after you stop one. This is because ECS tries to keep the 
kast count at your _desred_ level. 

## Observe that the load tests contain no/few failed requests


Your report might look something like this

```shell
     data_received..................: 2.0 MB 6.5 kB/s
     data_sent......................: 375 kB 1.2 kB/s
     http_req_blocked...............: avg=43.51µs min=3.75µs  med=5.55µs  max=11.56ms  p(90)=10.15µs p(95)=11.99µs 
     http_req_connecting............: avg=12.56µs min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      
     http_req_duration..............: avg=2.29ms  min=1.05ms  med=1.94ms  max=122.79ms p(90)=2.87ms  p(95)=3.09ms  
       { expected_response:true }...: avg=2.29ms  min=1.05ms  med=1.94ms  max=122.79ms p(90)=2.87ms  p(95)=3.09ms  
     http_req_failed................: 0.00%  ✓ 0        ✗ 2998
     http_req_receiving.............: avg=46.73µs min=19.51µs med=36.91µs max=464.19µs p(90)=66.8µs  p(95)=93.84µs 
     http_req_sending...............: avg=34.94µs min=9.28µs  med=18.1µs  max=1.08ms   p(90)=41.97µs p(95)=171.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      
     http_req_waiting...............: avg=2.21ms  min=1ms     med=1.87ms  max=122.69ms p(90)=2.79ms  p(95)=3.02ms  
     http_reqs......................: 2998   9.963744/s
     iteration_duration.............: avg=1s      min=1s      med=1s      max=1.12s    p(90)=1s      p(95)=1s      
     iterations.....................: 2998   9.963744/s
     vus............................: 10     min=10     max=10
     vus_max........................: 10     min=10     max=10```
```

# Extra tasks 

* Look more into Ramp ups and how to use options https://k6.io/docs/get-started/running-k6/
* How much can you stress the application? What will break first? Cloud 9 or the app?

# Conclusion 

'* In this lab you saw how we can make a system robust and resilient to failures by implementing load balancing and automatic scaling 
* We also got a brief introduction to load testing with the K6 framework 
* We dug a bit under the hood of ECS and saw how the concepts of tasks and services work.