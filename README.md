#puppet-phpmyadmin

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What phpmyadmin affects](#what-phpmyadmin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with phpmyadmin](#beginning-with-phpmyadmin)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#todos)

##Overview

This small phpmyadmin module installs and configure phpmyadmin.
Optionally razor and pyzor can be managed.

##Module Description

See [Overview](#overview) for now.

##Setup

###What phpmyadmin affects

* Installs phpmyadmin.
* Allow for dynamic configuration of nodes.

###Setup Requirements

Nothing.
	
###Beginning with phpmyadmin	

Simply include it.

##Usage

Just include the module by 

```puppet
include phpmyadmin
```

##Limitations:

Tested only on 
* Debian 7
so far.

##TODOs:

* Make it work on RedHat like systems.
* Make mare configurable.
* ... suggestions? Open an issue on github...
