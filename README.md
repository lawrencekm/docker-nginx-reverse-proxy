### Dockerized Nginx Reverse Proxy for Multiple Sites

This Dockerized Nginx setup acts as a reverse proxy to host multiple sites behind a single Nginx server. 
It enables you to easily manage and route incoming traffic to different backend services or containers using domain-based routing.
Motivation was to quickly host several websites on one server for an event. I achieved this by running all containerized websites (wordpress,laravel,nodejs apps) behind one docker reverse proxy; all in one AWS Ec2 server instance.


## Use this to:
Hosting Multiple Sites Behind a Single Nginx Server or to Implement basic load balancing to distribute incoming traffic across multiple backend(upstream) servers to improve the overall performance and reliability of your applications.

### Usage Instructions
Requires docker to be running

## Clone the Repository
```
git clone https://github.com/lawrencekm/airtime-api-kenya.git
cd airtime-api-kenya
```
## Configuration:
Update the default.conf file according to your site configurations and upstream servers. Modify the upstream blocks and server blocks to reflect your desired routing configuration.

## Build the Docker Image:
```
docker-compose build
```
## Run the Docker Container:
```
docker-compose up -d
```

## Accessing Sites:
Ensure that your domain names are correctly mapped to the IP address of the host running the Docker container.
Access your sites using the configured domain names. For example:
http://dashboard.wezadata.com
http://internship.wezadata.com
http://wp.wezadata.com
http://wp-internship.wezadata.com

## Customization:
Customize the default.conf file to add more server blocks for additional sites or services.
Update the Dockerfile and Nginx configurations as needed to suit your specific requirements.

## HTTPS Support (Optional):
For HTTPS support, you can configure SSL certificates for your domains and update the Nginx configuration accordingly. Remember to expose port 443 and handle SSL termination within Nginx

## Note
Add deployment limits to restrict amount of cpu, memory the containers will use.
