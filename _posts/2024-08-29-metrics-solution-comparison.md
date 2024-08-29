---
layout: post
title: "A comparison between metrics solutions"
logo: /assets/images/mimir-logo.png
author: "Jorge Heleno"
tags: ["infrastructure", "observability", "metrics"]
published: true
---

## Background
If you have been a user, deployer, or maintainer of large observability stacks
 you have probably come into this predicament yourself in the past. I have came
 accross some observability stacks in the past and have seen single instance prometheus
 gathering metrics for everything in the infrastructure and services to
 full fledged thanos stack in pull mode and even some more (not dated)
 stacks using snmp alongside cacti.

Lately I've come with the task of revamping an observability stack.
 In this case the stack was in fairly good shape but ran into some shortcomings,
 the worst being running on a single tenant, outdated, Cortex instance with little
 to no maintenance anymore which proven hard to manage.
 With Cortex losing some maintenance in the past few years due to (quotation needed)
 contributors embracing different projects, I needed to find a
 different solution which fit my needs, but would still
 keep Cortex in mind.

Initially I set out to set a list of requirements for our new solution.

## Requirements
The solutions we want to evaluate should have the requirements we are looking for
 as if they don't they shouldn't be considered as a runner-up. As such I crunched
 a list of supported features my new solution should have:
 1. Must support multi-tenancy.
    1. This is and will continue to be an environment which will have more than
        one kubernetes cluster reporting to it hence it should have the possibility of multi-tenancy
 2. It must be queried in a promql fashion
    1. Some systems will query it and it would require changes to them to make it compatible
 3. It should query large amounts of time (7 days+) in usable time (a couple of seconds)
 4. 