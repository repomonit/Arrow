node "default" {
	include capuz_vermelho
}

node devops.salas4linux.com.br {
	include base
}

#node docker.salas4linux.com.br {
#	include mr_miracle
#}

node /(docker|automation).salas4linux.com.br/ {
       include docker
}
