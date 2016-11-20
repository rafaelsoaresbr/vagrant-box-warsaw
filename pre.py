#!/usr/bin/env python2

import sys

with open('/sys/devices/virtual/dmi/id/modalias') as f:
  modalias = f.read().split(':')[1:-1]
  
dmi = {
  'bvn': ('DmiBIOSVendor', modalias[0]),
  'bvr': ('DmiBIOSVersion', modalias[1]),
  'bd': ('DmiBIOSReleaseDate', modalias[2]),
  'svn': ('DmiSystemVendor', modalias[3]),
  'pn': ('DmiSystemProduct', modalias[4]),
  'pvr': ('DmiSystemVersion', modalias[5]),
  'rvn': ('DmiBoardVendor', modalias[6]),
  'rn': ('DmiBoardProduct', modalias[7]),
  'rvr': ('DmiBoardVersion', modalias[8]),
  'cvn': ('DmiChassisVendor', modalias[9]),
  'ct': ('DmiChassisType', modalias[10]),
  'cvr': ('DmiChassisVersion', modalias[11])
}

customize_t = 'vb.customize ["setextradata", :id, "{0}", "{1}"]'
prefixo = "VBoxInternal/Devices/pcbios/0/Config/"

# https://duvidas.dicio.com.br/identacao-ou-indentacao/
indentacao = '    '
customizes = indentacao + '### gerado pelo {0} \n'.format(sys.argv[0])

for key, value in dmi.iteritems():
  sufixo = value[0]
  valor = (value[1])[len(key):]
  
  if valor.strip() == '':
    valor = 'NotAvailable'
  
  if sufixo != 'DmiChassisType':
    valor = 'string:' + valor
    
  customizes += indentacao + customize_t.format(prefixo + sufixo, valor) + '\n'

customizes += indentacao + '### fim'

with open(sys.argv[1]) as vagrantfile_t:
  v = vagrantfile_t.read()
  v = v.replace(indentacao + '# placeholder', customizes)
  sys.stdout.write(v)
