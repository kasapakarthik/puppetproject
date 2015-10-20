class slave {

#package { 'yum':
#	name => "yum",
#	ensure => latest,
#}

#to install several packages at once
$grouppack = ["yum", "vim"]
package {$grouppack: ensure => "present"}

#to create a file test.txt on desktop
file { "/home/slave/Desktop/test.txt":
	ensure => "present",
}

#to create a directory folder1 on desktop
file { "/home/slave/Desktop/folder1":
	ensure => "directory",
}

#to create a file testfile.txt in folder1
file { "/home/slave/Desktop/folder1/testfile.txt":
	ensure => "present",
	content => "this is a test file",
}

#to crate direstory tree
file { [ "/home/slave/Desktop/folder2/", "/home/slave/Desktop/folder2/infolder/", "/home/slave/Desktop/folder2/infolder2" ]:
 	ensure => "directory",
}

#execute a command
exec { "show puppet version":
	command => "puppet -V",
}

#defining a universal path for executable commands
Exec { path => [ "/bin/", "/sbin", "/usr/bin", "/usr/sbin" ] }
}
