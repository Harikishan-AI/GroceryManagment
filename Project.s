#-----------------------------------DATA-------------------------------------
#-----------Inside the data and text ASCI values are entered-------------            
                .data
welcome:        .asciiz "
                        ***************** Welcome *****************"
choice:         .asciiz "\n
                          Enter the number for the item you require\n 
                        1 --> Onions - Rs.38   2 --> Tomatoes - Rs.30    3 --> Potatoes - Rs.45\n
                        4 --> Apple - Rs.120   5 --> Bananas - Rs.84     6 --> Dry Fruits - Rs.185\n
                        7 --> Eggs - Rs.50     8 --> Salt - Rs.35        9 --> Pepper - Rs.60 \n
                        \t\t  " 
c_name:         .asciiz "\n
                        Customer name:  "   #userinput
user_input:     .space 20                   #the space and size of the character specified       
phone:          .asciiz "\n
                        Phone number: +91-"    #userinput
p_input:        .space 20                   #the space and size of the character specified 
amt:            .asciiz "\n
                        Amount paid: Rs."     #userinput
amt_input:      .space 30                   #the space and size of the character specified 
balance:        .asciiz "
                        Balance amount: Rs."
response:       .asciiz "
                        Entered item number is:  "
one_string:     .asciiz "
                        Item name:  Onions"
two_string:     .asciiz "
                        Item name:  Tomatoes"
three_string:   .asciiz "
                        Item name:  Potatoes"
four_string:    .asciiz "
                        Item name:  Apple"
five_string:    .asciiz "
                        Item name:  Banana"
six_string:     .asciiz "
                        Item name:  Dry Fruits"
seven_string:   .asciiz "
                        Item name:  Egg"
eight_String:   .asciiz "
                        Item name:  Salt"
nine_string:    .asciiz "
                        Item name:  Pepper"
default_string: .asciiz "
                        Item is not available in the grocery"
exit1:           .asciiz "\n
                        **************** Thank You *****************"
exit2:          .asciiz "\n
                        *************** Visit Again ***************"
                .text

#-------------------Main Body of the MIPS Assembly language Begins-------------------------

main:
                #li stands for Load immidiate             1 --> 32 bit integer
                #la stands for Load Address               4 --> print string
                #v0 stands for operation number           5 --> 32 bit integer
                #a0 stands for opertaion parameters
                #v0 stands for results

                li $v0, 4
                la $a0, welcome         #displays welcome
                syscall

                li $v0, 4       
                la $a0, choice          #enter the choice as given
                syscall  

                li $v0, 5
                syscall
                move $t0, $v0           #$t0 = $v0


                li $v0, 4
                la $a0, c_name          #displays customer name
                syscall

                li $v0, 8
                la $a0, user_input      #getting user's name
                li $a1, 20
                syscall

                li $v0, 4
                la $a0, response        #Printing the response from the data 
                syscall

                li $v0, 1
                move $a0, $t0           #$a = $t0 the we call the system
                syscall

                li $v0, 4
                la $a0, phone           
                syscall                 #disply phone number

                li $v0, 8
                la $a0, p_input         #getting user's phone number
                li $a1, 20
                syscall

#-------------If else statment Begins------------------

                beq $t0, 1, one           #if $t0 == 1 go to case one
                li $t9, 2                       #now $t0 = 2

                beq $t0, $t9, two         #if $t0 == 2 go to case two
                li $t9, 3                       #now $t0 = 3

                beq $t0, $t9, three       #if $t0 == 3 go to case three
                li $t9, 4                       #now $t0 == 4

                beq $t0, $t9, four        #if $t0 == 4 go to case four
                li $t9, 5                       #now $t0 == 5

                beq $t0, $t9, five        #if $t0 == 5 go to case five
                li $t9, 6                       #now $t0 == 6

                beq $t0, $t9, six         #if $t0 == 6 go to case six
                li $t9, 7                       #now $t0 == 7

                beq $t0, $t9, seven       #if $t0 == 7 go to case seven
                li $t9, 8                       #now $t0 == 8

                beq $t0, $t9, eight       #if $t0 == 8 go to case eight
                li $t9, 9                       #now $t0 == 9
                
                beq $t0, $t9, nine        #if $t0 == 9 go to case nine
                j   default                  # goes to default case

# ----------Switch case statement implementation Begins  -------------

         one:   li $v0, 4
                la $a0, one_string        #System calls the one_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 38          #$t0 = $t1 - Price of Onion
                move $a0, $t0
                syscall
                
                j  end_case               #jump to endcase

         two:   li $v0, 4
                la $a0, two_string        #System calls the two_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 30          #$t0 = $t1 - Price of Tomato
                move $a0, $t0
                syscall
                j  end_case               #jump to endcase

       three:   li $v0, 4
                la $a0, three_string      #System calls the three_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0              #$t0 = $v0

                li $v0, 4
                la $a0, balance            #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 45           #$t0 = $t1 - Price of Potato
                move $a0, $t0
                syscall
                j  end_case               #jump to endcase

        four:   li $v0, 4
                la $a0, four_string       #System calls the four_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall
 
                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 120         #$t0 = $t1 - Price of Apple
                move $a0, $t0
                syscall
                j end_case                #jump to endcase
        
        five:   li $v0, 4
                la $a0, five_string       #System calls the five_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 84          #$t0 = $t1 - Price of Bananas
                move $a0, $t0
                syscall
                j end_case                #jump to endcase
        
         six:   li $v0, 4
                la $a0, six_string        #System calls the six_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 185         #$t0 = $t1 - Price of Dry Fruits
                move $a0, $t0
                syscall
                j end_case                #jump to endcase
        
       seven:   li $v0, 4
                la $a0, seven_string      #System calls the seven_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 50         #$t0 = $t1 - Price of Eggs
                move $a0, $t0
                syscall
                j end_case                #jump to endcase

       eight:   li $v0, 4
                la $a0, eight_string      #System calls the eight_String data
                syscall

                li $v0, 4
                la $a0, amt               #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0             #$t0 = $v0

                li $v0, 4 
                la $a0, balance           #balance string is called
                syscall

                li $v0, 1
                sub $t0, $t1, 35          #$t0 = $t1 - Price of Salt
                move $a0, $t0
                syscall
                j end_case               #jump to endcase

        nine:   li $v0, 4
                la $a0, nine_string      #System calls the nine_String data
                syscall

                li $v0, 4
                la $a0, amt              #amount string is called
                syscall

                li $v0, 5
                syscall

                move $t1, $v0            #$t0 = $v0

                li $v0, 4
                la $a0, balance          #balance string is called
                syscall 

                li $v0, 1
                sub $t0, $t1, 60         #$t0 = $t1 - Price of Pepper
                move $a0, $t0
                syscall
                j end_case                #jump to endcase

     default:   li $v0, 4 
                la $a0, default_string    #System calls the default_string
                syscall 
                j  end_case               #jump to endcase

    end_case:       
                li $v0, 4
                la $a0, exit1
                syscall

                li $v0, 4
                la $a0, exit2
                syscall

                li $v0, 10               # system call code for exit = 10
                syscall

#------------Switch case statement implementation Ends---------------

#-----------------If else statment Ends-----------------------

#--------------------------MIPS Assembly language Ends----------------------------







