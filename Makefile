NAME = cloud-1

$(NAME):

all: $(NAME)

deploy:
	ansible-playbook ./site/deploy.yml

destroy:
	ansible-playbook ./site/destroy.yml

reboot:
	$(MAKE) destroy
	$(MAKE) deploy