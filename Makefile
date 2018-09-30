.PHONY: default
default: up

# コンテナを停止する
.PHONY: stop
stop:
	docker-compose stop

# コンテナを削除する
.PHONY: clean
clean: stop
	docker-compose rm -f

# コンテナを削除する。不要なボリュームも消す
.PHONY: clean-all
clean-all:
	-docker ps -qa | xargs docker stop | xargs docker rm -f
	docker volume prune -f

.PHONY: build
build: clean
	docker-compose build

.PHONY: up
up: build
	docker-compose up -d

# ansible実行
.PHONY: run-ansible
run-ansible:
	docker run \
		-v $$HOME/.ssh:/root/.ssh \
		-v `pwd`/config/.ansible.cfg:/root/.ansible.cfg \
		-v `pwd`/ansible:/root/ansible \
		-it docker_ansible \
		ansible-playbook -i inventories/development/hosts site.yml -k --ask-become-pass

