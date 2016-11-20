# warsawvm

## O que é:

Tentativa de automatizar a instalação do warsaw (infame módulo de segurança dos bancos) em máquinas virtuais.

## Como funciona:

Olhando o código fonte - sim você **deve** olhar, principalmente tratando-se de dados tão sensíveis quanto os bancários - 
dá pra sacar quase tudo.

O pulo do gato tá na simulação de alguns dados referentes à BIOS.
O warsaw observa se está ou não numa VM, então é essencial fazê-lo pensar que não está.

A princípio, o warsaw checa os seguintes arquivos:

`/sys/devices/system/cpu/online`
`/sys/devices/virtual/dmi/id/modalias` 

O primeiro arquivo informa quantos cores o processador tem. 
Que computador moderno o suficiente pra rodar o warsaw possui apenas 1 core (configuração padrão do virtualbox)? Então...
Apesar disso, não tenho certeza se isso afetou o funcionamento do warsaw.

O segundo arquivo possui várias informações a repeito do hardware (fabricante, modelo) e da BIOS (fabricante, versão).
Essas informações são providas pela DMI e estão gravadas na ROM da sua máquina.
Por padrão, as máquinas virtuais não simulam essas informações. Um exemplo desse arquivo numa VM do virtualbox:

`dmi:bvninnotekGmbH:bvrVirtualBox:bd12/01/2006:svninnotekGmbH:pnVirtualBox:pvr1.2:rvnOracleCorporation:rnVirtualBox:rvr1.2:cvnOracleCorporation:ct1:cvr:`

## Dependências

`vagrant`
`python`

## Como usar:

`$ python pre.py Vagrantfile.template > Vagrantfile`
`$ vagrant up`

Vai demorar um pouco.

O arquivo pre.py pega informações da DMI da sua máquina (host) e gera um Vagrantfile, que irá passar essas infos para a máquina virtual.

A VM tem uns 415 MB, mas só é preciso baixá-la uma vez.

As atualizações, dependências e warsaw somam uns 80 MB.

Se tudo ocorrer ok, a máquina virtual irá reiniciar e uma janela do firefox irá aparecer (dentro da VM, claro).

Pra testar se deu tudo certo mesmo, acesse a página de diagnóstico do warsaw ou do seu banco:

http://www.gastecnologia.com.br:8080/diagnostico/index.jsp
https://imagem.caixa.gov.br/asc/diagnostico.htm

## Links úteis:

http://blog.michaelboman.org/2014/01/making-virtualbox-nearly-undetectable.html
http://www.sysdig.org/wiki/sysdig-user-guide/
http://people.skolelinux.org/pere/blog/Modalias_strings___a_practical_way_to_map__stuff__to_hardware.html
https://www.virtualbox.org/manual/ch09.html#changedmi

## TODO:

- Endurecer a máquina virtual.
