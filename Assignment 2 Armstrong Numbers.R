#STEP 1:Prompt the user to enter a three digit positive number

answer <- readline(prompt = "Enter a three-digit positive number: ")
number <- as.numeric(answer)
#'Here I assign the line of code to the variable answer so that when the person 
#'running the code enters their value in the console, it automatically will be 
#'assigned to the "answer" variable.
#'I also then make sure R knows to treat the user input as a numeric value by
#'using the as.numeric() function, if the user inputs a value that is not numeric
#'the variable "number" will be equated to NA, we will leverage this NA output 
#'to help generate an Error message whenever the "number" variable is equal to NA

#STEP 2: Check if the user input is numeric. If not, print an error message and 
#'quit.

if (is.na(number)) { print("Error: The input is not numeric."); quit() }
#'In this line of code I ask R to check whether the input provided by the user 
#'is a number, if this is not the case an error message is displayed and the 
#'R script aborts. I use the is.na function to determine whether the code line number 
#'4 detected a non numeric value thus causing the variable "number" to equal NA.

#STEP 3: Check if the number is narcissistic. A narcissistic number, or an 
#'Armstrong number, is a number that is equal to the sum of the cubes of its own 
#'digits. 153, 370, 371, 407 are three digit Armstrong numbers.

#STEP 4:Display the result with an appropriate message, e.g. “127 is not an 
#'Armstrong number” or “370 is a narcissistic number” or any additional fun text 
#'you may want to add.
