#!/bin/bash
# guessinggame.sh
# A simple game to guess the number of files in the current directory

# Function to count files in the current directory
count_files() {
  ls -1 | wc -l
}

# Function to check the user's guess
check_guess() {
  if [[ $1 -lt $2 ]]; then
    echo "Your guess is too low. Try again."
  elif [[ $1 -gt $2 ]]; then
    echo "Your guess is too high. Try again."
  else
    echo "Congratulations! You guessed the correct number of files."
    return 0
  fi
  return 1
}

# Main program
echo "Welcome to the Guessing Game!"
file_count=$(count_files)

while true; do
  read -p "Guess how many files are in the current directory: " guess
  check_guess $guess $file_count
  if [[ $? -eq 0 ]]; then
    break
  fi
done
