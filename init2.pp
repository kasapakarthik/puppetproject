class code1 {

$content = [ "hello. this is the content of the file." ]
$packs = [ "vim", "tree" ]
$owner = "puppet"


file { ["/tmp/code1/k1.txt", "/tmp/code1/k2.txt"]:
	ensure => "file",
	content => $content,
	owner => $owner
}

file  { "/tmp/code1":
	ensure => "directory",
}

exec { "package install":
	command => "apt-get install yum",
	path => [ "/bin/", "/sbin", "/usr/bin", "/usr/sbin" ],
}

case $osfamily {
	"ubuntu" : {
		package { $packs:
		ensure => "present",
}
}
}

if $::hostname == "kilo" {
file { "/tmp/k3.txt"
	ensure => "present",
	content => $content,
}
}

else {
file { "/tmp/k4.txt"
	ensure => "present",
	content => "new file",
}
}

}






























