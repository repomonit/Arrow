class docker {
	case $::osfamily{
		"debian":{
			exec{"update_package_debian":
				command => "/usr/bin/apt-get update"
			}
			package{["apt-transport-https","ca-certificates","curl","software-properties-common"]:
				ensure => present,
			}
			exec{"GPG Key":
				command => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add - ; /usr/bin/add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" ; /usr/bin/apt-get update'
			}
			package{"docker-ce":
				ensure => present
			}
		}
		"redhat":{
                        package{["yum-utils","device-mapper-persistent-data","lvm2"]:
                                ensure => present
                        }
			exec{"update_package_redhat":
				command => "/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo ; /bin/yum-config-manager --enable docker-ce-edge ; /bin/yum-config-manager --enable docker-ce-test ; /bin/yum-config-manager --disable docker-ce-edge"
			}
                        package{"docker-ce":
                                ensure => present
                        }
                }
	}
}
