//
//  rockPaperScissors.swift
//
//  Created by Liam Csiffary
//  Created on 2022-03-20
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program allows the user to play rock paper
// scissors against the computer
// it also records the score
//


// finds and returns who won
func WhoWon(user: Int, computer: Int) -> Int {
  // define vars
  var computerWinVar = 0
  var userWinVar = 0

  // makes the numbers loop from 0-2
  // 2 + 1 = 0
  if (computer == 0) {
    computerWinVar = 3
  } else {
    computerWinVar = computer
  }

  if (user == 0) {
    userWinVar = 3
  } else {
    userWinVar = user
  }

  // finds who won
  if (user == computer) {
    return 0
  } else if (user + 1 == computerWinVar) {
    return 1
  } else if (userWinVar - 1 == computer) {
    return 2
  } else { // should never happen
    print("impossible")
    return 3
  }
}


// main function
func main() {
  // explanation
  print("This is rock paper scissors, guess one of the three and beat the computer!");
  
  // gets the number of wins required to win
  var wins = -1
  while (true) {
    print("How many wins to win: ")
    let winsString = readLine()
    // makes sure the input is a positive nonzero int
    do {
      wins = Int(winsString!) ?? -1
      if (wins > 0) {
        break
      } else {
        print("Please input a nonzero positive int")
      }
    }
  }

  // define vars
  var userWins = 0
  var computerWins = 0
  var ties = 0
  var userGuessAbsolute = 0

  // while no one has won
  while(wins > userWins && wins > computerWins) {

    // generates computers guess
    let computerGuess = Int.random(in: 0..<3)
    var invalidGuess = true

    // gets users guess
    while(invalidGuess == true) {
      invalidGuess = false
      print("Guess: rock paper scissors, r p s, or 1 2 3")
      let userGuess = readLine()

      // then converts the guess into an absolute value
      if (userGuess == "r" || userGuess == "1" || userGuess == "rock") {
        userGuessAbsolute = 0
        print("You guessed rock")
        
      } else if (userGuess == "p" || userGuess == "2" || userGuess == "paper") {
        userGuessAbsolute = 1
        print("You guessed paper")
        
      } else if (userGuess == "s" || userGuess == "3" || userGuess == "scissors") {
        userGuessAbsolute = 2
        print("You guessed scissors")
        
      } else {
        print("Please input one of the options listed")
        invalidGuess = true
      }
    }

    // prints the computers decision
    if (computerGuess == 0) {
      print("Computer guessed rock")
    } else if (computerGuess == 1) {
      print("Computer guessed paper")
    } else {
      print("Computer guessed scissors")
    }

    // calls the function to find out who won
    let winner = WhoWon(user: userGuessAbsolute, computer: computerGuess)

    // adds to the scores and tells the user who won
    if (winner == 0) {
      print("tie")
      ties += 1
    } else if (winner == 1) {
      print("You lost")
      computerWins += 1
    } else {
      print("You won")
      userWins += 1
    }
    
    // prints the current score
    print("The current score is", userWins, "-", computerWins, "-", ties)
  }
  
  // after the game is over prints the total score
  print("Well played, the score was", userWins, "-", computerWins, "-", ties)
}

// calls main to start the program
main()
