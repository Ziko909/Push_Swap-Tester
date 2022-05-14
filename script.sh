#!/bin/sh
# Author : Zakaria Aabou
# Date : 6/05/2022
Path_prog=../../pushh/push_swap

intro() {
	echo "\x1b[32m
		
										██████╗ ██╗   ██╗███████╗██╗  ██╗        ███████╗██╗    ██╗ █████╗ ██████╗     ████████╗███████╗███████╗████████╗███████╗██████╗ 
										██╔══██╗██║   ██║██╔════╝██║  ██║        ██╔════╝██║    ██║██╔══██╗██╔══██╗    ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗
										██████╔╝██║   ██║███████╗███████║        ███████╗██║ █╗ ██║███████║██████╔╝       ██║   █████╗  ███████╗   ██║   █████╗  ██████╔╝
										██╔═══╝ ██║   ██║╚════██║██╔══██║        ╚════██║██║███╗██║██╔══██║██╔═══╝        ██║   ██╔══╝  ╚════██║   ██║   ██╔══╝  ██╔══██╗
										██║     ╚██████╔╝███████║██║  ██║███████╗███████║╚███╔███╔╝██║  ██║██║            ██║   ███████╗███████║   ██║   ███████╗██║  ██║
										╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝            ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

													--* BY Zaabou *--
                            \x1b[0m"
}

take_input()
{
	echo "\x1b[35m                        							Please Enter The Path Of Your Prog (Push_Swap) \x1b[0m";read Path_prog
	echo "\x1b[35m 										Please Enter The Amount Of Numbers \x1b[0m";read stack_size
	echo " \x1b[35m 										Please Enter The Number Of The Test's \x1b[0m";read N_test
	if [ $stack_size -eq 3 ]
	then
		max=3
	elif [ $stack_size -eq 5 ]
	then
		max=12
	elif [ $stack_size -le 100 ]
	then
		max=700
	elif [ $stack_size -le 500 ]
	then
		max=5500
	fi
}

run_test()
{
	mkdir test_cases
	for i in `seq $N_test`
	do
		seq -$stack_size $stack_size | sort -R |  head -$stack_size | xargs > test_cases/test_case_$i.txt
		amount_of_ins=$(./$Path_prog/push_swap $(cat test_cases/test_case_$i.txt) | wc -l)
		result="$(./$Path_prog/push_swap $(cat test_cases/test_case_$i.txt) | ./checker $(cat test_cases/test_case_$i.txt))"
		if [[ "$result" == "OK" && $amount_of_ins -le $max ]]
		then
			echo "\x1b[35m Test	$i			:			\x1b[32m OK	\x1b[35mInstructions -> \x1b[32m $amount_of_ins \x1b[0m" 
		elif [ "$result" == "OK" ]
		then
			echo "\x1b[35m Test	$i			:			\x1b[32m OK \x1b[35m	Instructions -> \x1b[31m $amount_of_ins \x1b[0m (The Amount Of Instructions Is Too Large)"
		elif [ "$result" == "KO" ]
		then
			echo "\x1b[35m Test	$i			:	\x1b[31m	KO \x1b[0m  The Stack Is Not Sorted"
		fi
	done
}
intro
take_input
run_test
