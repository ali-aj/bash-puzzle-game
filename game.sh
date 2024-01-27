#!/bin/bash

declare -A matrix
declare -A goalState
declare -a generated_numbers
declare -a legal_moves
declare -a path
declare current_Row
declare current_Col

generate_random_numbers () {
	unset generated_numbers
	while [ ${#generated_numbers[@]} -lt 25 ]; do
        random_number=$((1 + $RANDOM % 25))
        if [[ ! " ${generated_numbers[@]} " =~ " $random_number " ]]; then
            generated_numbers+=($random_number)
        fi
    done
}

print_matrix () {
	echo "---- Current State ----"

    for ((i = 0; i < 5; i++)); do
        for ((j = 0; j < 5; j++)); do
        	if [ ${matrix[$i,$j]} -ge 10 ]; then
	        	echo -n "${matrix[$i,$j]} | "
	        elif [ ${matrix[$i,$j]} -eq -1 ]; then
	        	echo -n "   | "
        	else
		    	echo -n "${matrix[$i,$j]}  | "    	
        	fi
        done
        echo
    done

    echo -e "\n\n\n------ Goal State ------"

    for ((i = 0; i < 5; i++)); do
        for ((j = 0; j < 5; j++)); do
            if [ ${goalState[$i,$j]} -ge 10 ]; then
	        	echo -n "${goalState[$i,$j]} | "
	        elif [ ${goalState[$i,$j]} -eq -1 ]; then
	        	echo -n "   | "
        	else
		    	echo -n "${goalState[$i,$j]}  | "    	
        	fi
        done
        echo
    done
}

init() {
	generate_random_numbers
    count=0

    for ((i = 0; i < 5; i++)); do
        for ((j = 0; j < 5; j++)); do
        	if [ ${generated_numbers[count]} -eq 25 ]; then
        		matrix[$i,$j]=-1	
        		current_Row=$i
        		current_Col=$j
        	else
            	matrix[$i,$j]=${generated_numbers[count]}
            fi
            count=$((count + 1))
        done
    done
}

goal () {
	generate_random_numbers

    count=0

    for ((i = 0; i < 5; i++)); do
        for ((j = 0; j < 5; j++)); do
        	if [ ${generated_numbers[count]} -eq 25 ]; then
        		goalState[$i,$j]=-1	
        	else
            	goalState[$i,$j]=${generated_numbers[count]}
            fi
            count=$((count + 1))
        done
    done
}

is_goal () {
	for ((i = 0; i < 5; i++)); do
        for ((j = 0; j < 5; j++)); do
        	if [ ${goalState[$i,$j]} -ne ${matrix[$i,$j]} ]; then
        		return 0
        	fi
        done
    done
    return 1
}

: <<'END'
Is_Solveable (goal, init_state) {
	
}

END

legal_moves () {
	unset legal_moves
	
	if [ current_Row -ne 0 ]; then
		legal_moves+=('U')
	fi
	
	if [ current_Row -ne 4 ]; then
		legal_moves+=('D')
	fi
	
	if [ current_Col -ne 0 ]; then
		legal_moves+=('L')
	fi
	
	if [ current_Col -ne 4 ]; then
		legal_moves+=('R')
	fi
}

print_path () {
	echo -n "Path: "
    path_string=""
    for direction in "${path[@]}"; do
        path_string+="$direction->"
    done
    # Remove the trailing "->"
    path_string="${path_string%->}"
    echo "$path_string"
}


make_move () {
	if [[ "$1" == $'\e[A' ]]; then
		path+=('U')
		
	elif [[ "$1" == $'\e[B' ]]; then
		path+=('D')
		
	elif [[ "$1" == $'\e[C' ]]; then
		path+=('R')
		
	elif [[ "$1" == $'\e[D' ]]; then
		path+=('L')
		
	fi
}

main () {
	init
	goal
	clear
	
	while true; do
		print_matrix
		echo -e "\n-> 'Up Arrow' for move up"
		echo "-> 'Down Arrow' for move down"
		echo "-> 'Left Arrow' for move left"
		echo "-> 'Right Arrow' for move right"
		read -s -n 3 user_move
		clear
		if [[ "$user_move" != $'\e[A' ]] && [[ "$user_move" != $'\e[B' ]] && [[ "$user_move" != $'\e[C' ]] && [[ "$user_move" != $'\e[D' ]]; then
			echo "ERROR: Invalid Move."
		else
			make_move "$user_move"
			is_goal
			print_path
			if [ $? -eq 1 ]; then
				break
			fi
		fi
	done 
}


main








