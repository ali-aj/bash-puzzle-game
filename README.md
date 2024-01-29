
# Puzzle Solver

A simple puzzle-solving script implemented in Bash.

## Description

This script generates a 5x5 grid puzzle and allows the user to move a blank tile within the grid to reach the goal state. The goal state is randomly generated, and the script checks if the generated puzzle is solvable before allowing the user to play.

## Features

- Randomly generated initial and goal states.
- User can move the blank tile (represented as `-1`) in Up, Down, Left, or Right directions.
- Checks for valid user moves and displays legal moves.
- Prints the path taken by the user to reach the goal state.
- Ends when the user reaches the goal state.

## Usage

1. Make the script executable:
   ```bash
   chmod +x game.sh
   ```

2. Run the script:
   ```bash
   ./game.sh
   ```

3. Follow the on-screen instructions to play the puzzle.

## Rules & Instructions

1. It is played on a 5-by-5 grid with 15 square blocks labelled 1 through 15 and a blank square. There are two boards, one is the board you play game at, other is the goal state we want to achieve. Your goal is to rearrange the tiles/blocks so that they are in the order specified as the goal state.
   ![image](https://github.com/ali-aj/bash-puzzle-game/assets/98086281/2317c3a4-d2c8-43c2-b7a8-8a99eab669ec)

2. You are permitted to slide blank tiles horizontally or vertically to make moves. The following shows a sequence of legal moves from an initial board position (left) to the new board state after the move (right).
### Left Move
   ![image](https://github.com/ali-aj/bash-puzzle-game/assets/98086281/ff7c8dfb-bad2-4428-a64e-5a0567a4b2bd)

### Down Move
   ![image](https://github.com/ali-aj/bash-puzzle-game/assets/98086281/bb8da699-a6f1-4069-8aa3-a5a39dd7d260)

### Up Move
   ![image](https://github.com/ali-aj/bash-puzzle-game/assets/98086281/73f51666-7f3b-4aef-9605-a9815d1a4261)

### Right Move
   ![image](https://github.com/ali-aj/bash-puzzle-game/assets/98086281/3876ca0d-a9cb-407c-b898-198670f30881)

3. In this game, a player moves the tiles starting from the initial state to reach the goal. Once the goal state is reached, the game will the sequence of moves the user took to reach the goal state.
e.g., Ini_State -> ‘U’, ‘R’, ‘D’, ‘D’, ‘L’ -> Goal


## Contributing

Feel free to contribute to improving the puzzle solver or report any issues. Pull requests are welcome!
