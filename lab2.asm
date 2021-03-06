# Title: 	Lab2 assignment
# Author: 	Davi Rodrigues Chaves
# Due Date:	Sep. 25th, 2015
# Date:		Sep. 11th, 2015

.data
array: .word, 11, 81, 44, 14, 59, 75, 12, 80, 29, 88 	# "array" of 10 words to contain the values
size: .word 10 						# size of "array"

.text
main:		la $t0, array			# Load address of the array
		lw $t2, 0($t0)			# Load first address of the array
		la   $t1, size			# Load address of the size variable
      		lw   $t1, 0($t1)		# Load size of the array
      		addi $t3 $zero, 0		# Set the counter variable to zero.
      		move $t7, $t2			# Set the max value ($t7) initially as $t2
      		# loop start here
loop:		slt $t6 $t7, $t2		# Compares $t7 with $t2
		beqz $t6, smaller		# Branches to smaller in the case that we haven't found a new max
		move $t7, $t2			# If a new max was found, the max value is updated
smaller:	addi $t3, $t3, 1		# Increments the counter
		add $t0, $t0, 4			# Updates the address of the current value of the array
		lw $t2, 0($t0)			# Update the current value
		slt $t6, $t3, $t1 		# Compares the counter with the size of the array
		bgtz $t6, loop			# When there is more iterations to do prior to find the max value
		# loop ends here

