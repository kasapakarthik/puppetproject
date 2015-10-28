class code1 {

#variables
$content = [ "hello. this is the content of the file." ]
$pack1   = [ "vim", "tree" ]
$pack2   = [ "yum" ]
$pack3   = [ "telnet" ]
$owner   = "puppet"


file { ["/tmp/code1/k1.txt", "/tmp/code1/k2.txt"]:
	ensure  => "file",
	content => $content,
	owner   => $owner
     }

file  { "/tmp/code1":
	ensure => "directory",
      }

exec { "package install":
	command => "apt-get install yum",
	path    => [ "/bin/", "/sbin", "/usr/bin", "/usr/sbin" ],
     } 

#case condition
case $osfamily {
	'Redhat' : {
		package { 'package':
			name   => 'vim',
			ensure => 'absent',
                        }
                   }
	'Debian' : {
		package { 'package':
			name   => 'vim',
			ensure => 'present',
                        }
                   }
               }

#if and else
if $::hostname == "kilo" {
	package { $pack2:
		ensure  => 'present',
                }
                         } 

else {
	package { $pack3:
		ensure  => 'present',
                }
     }
}






























