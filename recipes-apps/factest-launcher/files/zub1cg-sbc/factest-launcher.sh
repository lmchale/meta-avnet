# ----------------------------------------------------------------------------
#
#        ** **        **          **  ****      **  **********  **********
#       **   **        **        **   ** **     **  **              **
#      **     **        **      **    **  **    **  **              **
#     **       **        **    **     **   **   **  *********       **
#    **         **        **  **      **    **  **  **              **
#   **           **        ****       **     ** **  **              **
#  **  .........  **        **        **      ****  **********      **
#     ...........
#                                     Reach Further
#
# ----------------------------------------------------------------------------
# 
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#  
#  Product information is available at:
#     https://avnet.me/zuboard-1cg
# 
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2022 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------
# 
#  Create Date:         Nov 28, 2016
#  Design Name:         Factory Test Launcher Script
#  Module Name:         factest-launcher.sh
#  Project Name:        Factory Test Launcher Script
#  Target Devices:      Xilinx Zynq and Zynq UltraScale+ MPSoC
#  Hardware Boards:     ZUBoard-1CG
# 
#  Tool versions:       Xilinx Vivado 2016.2
#                       Xilinx Vivado 2017.3
#                       Xilinx Vivado 2021.2
# 
#  Description:         Factory Test Launcher Script
# 
#  Dependencies:        Factory Test (factest.sh)
#
#  Revision:            Nov 28, 2016: 1.0 Initial version
#                       Jan 29, 2018: 1.1 Added option to infinitely loop
#                                         the SOM-only tests
#                       Sept 23,2022: 1.2 Modified for running ZUBoard-1CG Factory Tests
# 
# ----------------------------------------------------------------------------
#!/bin/sh

FACTORY_TEST_SCRIPT=/home/root/factest.sh

# Show the factory test banner.
echo " "
echo "******************************************************************"
echo "***                                                            ***"
echo "***    Avnet ZUBoard-1CG Factory Test Launcher V1.0            ***"
echo "***                                                            ***"
echo "******************************************************************"
echo "***                                                            ***"
echo "***    Please Press Key to Perform Desired Function Below:     ***"
echo "***                                                            ***"
echo "***    'f' - Factory Test                                      ***"
echo "***    'i' - Run Unattended Factory Test in Infinite Loop     ***"
echo "***    'x' - Linux Command Prompt                              ***"
echo "***                                                            ***"
echo "***    NOTE: Waiting will AUTO-INITIATE Factory Test           ***"
echo "***                                                            ***"
echo "******************************************************************"
echo " "

while :
do
	answer="c"
	read -t 5 answer
	if [ "$answer" = "x" ]
	then
		echo " "
		echo "******************************************************************"
		echo "*** Exiting to Linux Command Prompt                            ***"
		echo "******************************************************************"
		echo " "
		break
	elif [ "$answer" = "f" ]
	then
		echo " "
		echo "******************************************************************"
		echo "*** Initiating Factory Test Suite                              ***"
		echo "******************************************************************"
		echo " "
		bash ${FACTORY_TEST_SCRIPT}
		break
	elif [ "$answer" = "i" ]
	then
		echo " "
		echo "******************************************************************"
		echo "*** Initiating Unattended Looped Factory Test Suite            ***"
		echo "******************************************************************"
		echo " "
		while true;
        do
          bash ${FACTORY_TEST_SCRIPT} -u
        done
		break
	# Currently we dont
	#elif [ "$answer" = "s" ]
	#then
	#	echo " "
	#	echo "******************************************************************"
	#	echo "*** Initiating Software Install to Flash Memory                ***"
	#	echo "******************************************************************"
	#	echo " "
	#	source ${FLASH_PROGRAMMING_SCRIPT}
	#	break
	else
		echo " "
		echo "******************************************************************"
		echo "*** Auto-Initiating Factory Test Suite                         ***"
		echo "******************************************************************"
		echo " "
		bash ${FACTORY_TEST_SCRIPT}
		break
	fi
done
