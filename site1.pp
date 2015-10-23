node 'slave.localdomain' {
include package
include slave
}

node 'client.localdomain' {
include client
}
