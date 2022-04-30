# cli_calc
Command-line reverse polish notation ([RPN](https://www.techopedia.com/definition/9194/reverse-polish-notation-rpn#:~:text=Polish%20Notation%20(RPN)-,What%20Does%20Reverse%20Polish%20Notation%20(RPN)%20Mean%3F,brackets%20to%20define%20evaluation%20priority)) calculator

## Description
- The application is using the Ruby [Readline](https://ruby-doc.org/stdlib-2.5.1/libdoc/readline/rdoc/Readline.html) module to allow input from the user and to display the output of the system.
- It reads the input from the user and checks if it's a number or an operator. If it's a number, it'll be stacked in a ruby array. If the input is an operator, it'll pop the latest numbers from the array, performs the operation and shows the partial or total result.
- The application works with both integers and bigdecimals. Use of floats is avoided.
- It only allows four operations. For divisions, the result will be displayed as [BigDecimal](https://ruby-doc.org/stdlib-2.5.1/libdoc/bigdecimal/rdoc/BigDecimal.html).
- If the operation is not allowed, it will show an error message and will remove the numbers for that operation
- The total is accumulated to keep iterating with more operations
- There's an option provided to clean the accumulator
- If there's an error during the execution, it will rescue the error, clear the accumulators and ask to start all over again.

## System requirements 

- Ruby 2.3.1 
- Command line tool

## Installation

1. Download the file calc.rb
2. Open a terminal and type

```
$ ruby calc.rb
```

## Usage

### Allowed inputs: 
1. "q" to exit the program
2. "ac" to clear the accumulator
3. Numbers: integers and decimals
4. Basic operators: "+" "-" "*" "/"


### Using the calc: 
1. Users will be allowed to enter the numbers and operators one at a time or in a single line. 
2. If the input is done in a single line, it'll be separated by a blank space.
3. The output will be stored in an accumulator. The user will have the option to clear the accumulator by typing "ac".
4. To exit the application, type in "q". 
5. Have fun! 


## Examples

```
> 5 
5
> 8
8
> +
13
```

```
> 5 5 5 8 + + -
-13.0
> 13 +
0.0
```

```
> -3
-3.0
> -2
-2.0
> *
6.0
> 5
5.0
> +
11.0
```

```
> 5
5
> 9
9
> 1
1
> -
8
> /
0.625
```

## Trade-offs
1. Help information
2. More validations on inputs given by user, including checking that the user provides a valid operation (at least two numbers and one operator, for example)
3. Only 4 basic operations
4. This can be converted into a service that can be accessed using API endpoints.
5. Automated tests and unit testing

