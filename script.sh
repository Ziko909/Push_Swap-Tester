#!/bin/bash
# Author : Zakaria Aabou
# Date : 6/05/2022
Path_prog=../push_swap
take_input()
{
  echo "Pleae Enter The Amount Of Numbers\n";read stack_size
  echo "Please Enter The Number Of The Test's\n";read N_test
  max=5000
}

run_test()
{
  for i in `seq $N_test`
  do
    for j in `seq $stack_size`; do echo "$RANDOM";done | tr '\n' ' ' > cases/test_case_$i.txtin
      amount_of_ins=$($path_prog $(cat cases/test_case_$i.txt) | ./checker $(cat cases/test_case_$i.txt) | wc -l)
      result=$(./$path_prog $(cat cases/test_case_$i.txt) | ./checker $(cat cases/test_case_$i.txt))
      if [ $result == 'OK' && $amount_of_ins -lt $max]
      then
        echo "OK"
      elif [ $result == 'OK' ]
      then
        echo "KO : The Amount Of Instructions Is Too Large\n"
      elif [$result == 'KO']
        echo "KO : The Stack Is Not Sorted\n"
      endif
    done
}
take_input
run_test
