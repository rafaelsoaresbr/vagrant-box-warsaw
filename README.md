# vagrant-box-warsaw

## O que é:

É um ambiente [Vagrant](https://www.vagrantup.com/downloads.html) que inclui a
base Ubuntu e o navegador Firefox com o módulo de segurança Warsaw pronto para
acessar sites bancários (testado com o BB).

## Como funciona:

Vagrant é uma ferramenta para construir e gerenciar ambientes em máquinas virtuais.
Com um simples comando você pode configurar, reproduzir e portar ambientes de
trabalho.

## Dependências

1. [VirtualBox com Pacote de Extensões](https://www.virtualbox.org/wiki/Downloads)

2. [Vagrant](https://www.vagrantup.com/downloads.html)

## Como usar:

`$ vagrant up`

>Este comando subirá uma máquina virtual rodando o Ubuntu 16.04 que será provida
com os softwares necessários para acessar a página do seu banco.

Para salvar seus arquivos (comprovantes, extratos, etc) basta você salva-los na
pasta Downloads dentro da máquina virtual que está mapeada para a pasta /dados
dentro desse projeto (máquina hospedeira).

Após o uso você pode encerrar a máquina com o comando `vagrant halt`.

Se preferir você pode apagar completamente a máquina virtual com `vagrant destroy`.

Pra testar se deu tudo certo mesmo, acesse a página de diagnóstico do warsaw ou
do seu banco:

http://www.dieboldnixdorf.com.br/warsaw

https://imagem.caixa.gov.br/asc/diagnostico.htm

## Projeto original

https://github.com/dinorox/warsawvm

## Links úteis:

http://blog.michaelboman.org/2014/01/making-virtualbox-nearly-undetectable.html

http://www.sysdig.org/wiki/sysdig-user-guide/

http://people.skolelinux.org/pere/blog/Modalias_strings___a_practical_way_to_map__stuff__to_hardware.html

https://www.virtualbox.org/manual/ch09.html#changedmi

## TODO:

- Endurecer a máquina virtual.
- Adicionar suporte ao docker.
