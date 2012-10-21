Puppet Module For Git Application Deployments
=============================================

This module simply checks out a git project and adds a VERSION file to the root folder.

Using the module
----------------
To use the module, clone this repository to _/etc/puppet/modules_ (or configure your _modulepath_)

Example
-------

	class { "gitapp":
		app_name        => "test-app",
		repository  	=> "https://github.com/andredumas/puppet-gitapp.git",
		path            => "/var/puppet-gitapp-test",
		owner           => "www-data",
		group           => "www-data",
	}

	gitapp::version { "test-app":
		require => Class["gitapp"]
	}


License
-------

This module is licensed under the Apache Software License 2.0.
