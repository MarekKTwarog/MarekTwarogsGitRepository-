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

singlenumbers <- as.numeric(strsplit(as.character(answer), "")[[1]])
cubesofsinglenumbers <- singlenumbers^3  
sumofcubesofsinglenumbers <- sum(cubesofsinglenumbers)
if(answer == sumofcubesofsinglenumbers){print(paste(answer, "is a narcissistic number please wait 48 hoours and try again with a different number"))} else {print(paste(answer, "is not an Armstront number congratulations🥳 "))}
#'For this section of code, I convert the "answer" variable (the number chosen by the user)
#'into a character value rather than numeric, this allows me to use the strsplit()
#'function to split up the 3 characters composing the number, I then convert the 
#'3 seperated characters back into a 3 digit numeric list using the as.numeric()
#'function. I also make sure to insert an empty string "" to separate the 3 characters.
#'To better explain this process, lets say my chosen number is 333, the 
#'strsplit(as.character(answer), "") function would yield the following list, 
#'list(c("3","3","3")) then by using [[1]] I am able to access the first element 
#'of the list  retrieving the value:'c("3","3","3"). The as.numeric() function 
#'then used on the list allows me to convert my characters into numbers so I can
#'perform my calculations, this is all assigned to the variable single numbers.
#'I then take the sube of the variable "singlenumbers", which takes the cube of each 
#'digit making up the original 3 digit number chosen by the user.
#' Next I take the sum of the "cubesofsinglenumbers" variable which gives me a 
#' sum for all the cubed digits and i assign the result to the "sumofcubesoofsinglenumbers"
#' variable
#' Finally I make an if/else statement where if the chosen number ("answer)
#' is equal to the "sumofcubesofsinglenumbers" variable then an error message 
#' is printed saying that "answer" is a narcissistic number, the else portion of
#' the statement prints a message saying the number is not an Armstrong number.

