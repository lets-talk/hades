HADES
===================

Comand line tool for creating microservices at Let's Talk.

## What should it do ?

- start with `.yml` as an entry point.
- create repository in Github.
- create Dockerfile with base image according to microservice's language/framework and version.
- create **staging** and **production** clusters in GKE.
- create `SQS` queues for each *microservice's* environment.
- create `SNS` topics for each *microservice's* environment.
- create **subdomain** for microservice.
- logging as a service (`Datadog` integration for production).
- create `Kubernetes` deploy config files according to dependencies.
- build docker image of certain version.
- configure outgoing mailer according to environment.

## Kubernetes configs

- according to the type of service should decide wheather create web `ingress/LBs` to app or not.
- create `services` config for each service dependency.
- create `storage volumes`.
- create `secrets`.

Should manage kubectl context according to environment. For example `development` should be pointed to local minicube and `production` in it's turn to GKE cluster.

## YAML structure

```yaml
--
version '1'

microservice:
	name: <NAME>
	services:
		- SQS
		- SNS
		- S3
		- K8
		- 'Route 53'
	kubernetes:
		config:
			- deployment.yml
```

## Script

- create repo with microservice name under letstalk namespace.
- create integration with CircleCI.
- create deployment config template file in infrastructure repo.
- create hades config template in infrastructure repo.
- create AWS S3, SNS and SQS for all environments using microservice's name.
- create staging and production subdomains for microservice using it's name.
- create staging and production clusters in GKE using microservice's name.