Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class { "gitapp":
	app_name	=> "test-app",
	repository  	=> "https://github.com/andredumas/puppet-play.git",
	path		=> "/var/puppet-gitapp-test",
	owner 		=> "www-data",
	group 		=> "www-data",
}
