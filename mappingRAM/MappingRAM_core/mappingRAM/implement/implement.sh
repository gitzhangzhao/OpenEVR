
 
 
 



 

#!/bin/sh

# Clean up the results directory
rm -rf results
mkdir results

#Synthesize the Wrapper Files

echo 'Synthesizing example design with XST';
xst -ifn xst.scr
cp mappingRAM_exdes.ngc ./results/


# Copy the netlist generated by Coregen
echo 'Copying files from the netlist directory to the results directory'
cp ../../mappingRAM.ngc results/

#  Copy the constraints files generated by Coregen
echo 'Copying files from constraints directory to results directory'
cp ../example_design/mappingRAM_exdes.ucf results/

cd results

echo 'Running ngdbuild'
ngdbuild -p xc6vlx75t-ff784-1 mappingRAM_exdes

echo 'Running map'
map mappingRAM_exdes -o mapped.ncd -pr i

echo 'Running par'
par mapped.ncd routed.ncd

echo 'Running trce'
trce -e 10 routed.ncd mapped.pcf -o routed

echo 'Running design through bitgen'
bitgen -w routed

echo 'Running netgen to create gate level Verilog model'
netgen -ofmt verilog -sim -tm mappingRAM_exdes -pcf mapped.pcf -w -sdf_anno false routed.ncd routed.v
