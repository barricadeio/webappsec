# What is this?

This docker image contains a subset of the tools we use within [Barricade](https://barricade.io) to automatically test the security of our application on every deployment. 

We strongly believe that security should be part of normal operations and to be part of normal operations, security needs to be an adition to the existing continuous deployment and integration toolset. 

# Continuous Integration, with Security

Our believe is that security should just be a part of normal operations. This repository is what we use to run security tests alongside unit tests, regression tests and acceptance tests. 

# Further Information

This repository contains some of the work we use to integrate security right into our continuous integration process. 

We use this when building our web apps with CircleCI. The process is:

1. Setup CircleCI 
2. Write unit tests for your app
3. Integrate the testing phase into your `circle.yml` file
4. Install the Barricade docker-agent every time a testing-cycle starts
5. Integrate the security testing phase into your circle.yml and docker files. 
6. Security testing is now continuous and you can easily filter for your tag on the Barricade dashboard to see the results of the scan.

## Wapiti

[Wapiti](http://wapiti.sourceforge.net) allows you to audit the security of your web applications.

It performs "black-box" scans, i.e. it does not study the source code of the application but will scans the webpages of the deployed webapp, looking for scripts and forms where it can inject data.

Once it gets this list, Wapiti acts like a fuzzer, injecting payloads to see if a script is vulnerable.

To run a Wapiti docker test, simply run the command below
```
docker run -t barricadeio/webappsec /usr/local/wapiti/bin/wapiti http://10.4.2.42/ -f json -b page -n 2 -o /tmp/scan.txt 
```

# Be Responsible

Whenever you are using this script, make sure you either are the owner of the site you are scanning or have the explicit authorization of the owner or people responsible for the web application you are testing.
