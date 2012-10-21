# Resource: play::git_app_install
# Installs a Play application from a git repository to the configured play apps_home.
#
# *repository* :  URL used to clone the repository
#
# Sample Usage:
# See included tests for sample usage
#
class gitapp($app_name, $repository, $path, $user = "root", $owner = "root", $group = "root") {
	$app_home = "$path/$app_name"

  	package { "git":
  		ensure => latest
  	}
  	
  	# If location does not exist
  	exec { "git-clone":
  		command => "git clone $repository $app_home",
  		cwd => "$path",
  		creates => "$app_home",
  		user => "$user",
  		require => Package["git"]
  	}

  	exec { "git-pull":
  		command => "git pull",
  		cwd => "$app_home",
  		user => "$user",
  		require => [Exec["git-clone"], Package["git"]]
  	}

  	exec { "git-reset":
  		command => "git reset --hard HEAD",
  		cwd => "$app_home",
  		user => "$user",
  		require => [Exec["git-pull"], Package["git"]]
  	}
  	
  	file { "$app_home":
  		ensure => directory,
  		owner => "$owner",
  		group => "$group",
  		recurse => "true",
  		require => [
  				Exec["git-pull"],
  				Exec["git-clone"],
  				Exec["git-reset"]
  			]
  	}
}	