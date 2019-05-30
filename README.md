## Create Lab on Vagrant with Cisco vIOS 

Лаба на Vagrant с использованием Cisco vIOS и Ansible для предварительной настройки. <br>
Основа лабы Vmware Fusion. <br>
Для создания дополнительных интерфейсов VMNETXX используется [скрипт](https://github.com/alexeykr65/Fusion_Vmnet) <br>
Описание дополнительных интерфейсов согласно схеме, находится в файле ***fusion_network.cfg*** <br>
Для создания интерфейсов необходимо запустить:<br>
`vmnet_cfg.py -a 'fusion_network.cfg' -s` <br>
Запуск лабы осуществляется командой:<br>
`vagrant up --provision-with "conf_int"`<br>
IP адреса интерфейсов описаны в файле ***src_cfg/vagrant_01.yml***, используются ipv4 и ipv6.<br>
Схема лабы ниже<br>
![Лаба](ine-vios_01.png)
