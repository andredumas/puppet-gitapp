define gitapp::version($version = "VERSION") {
  	include gitapp
  	
	exec {"git-describe":
		command => "git describe --all --long > $gitapp::app_home/$version",
	  	cwd => "$gitapp::app_home",
	  	user => "$gitapp::owner",
	}

	exec {"date":
		command => "date +%Y%m%d%H%M%S >> $gitapp::app_home/$version",
	  	cwd => "$gitapp::app_home",
	  	user => "$gitapp::owner",
	  	require => Exec["git-describe"]
	}
}	