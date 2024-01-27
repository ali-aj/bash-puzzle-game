
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
   chmod +x puzzle_solver.sh
   ```

2. Run the script:
   ```bash
   ./puzzle_solver.sh
   ```

3. Follow the on-screen instructions to play the puzzle.

## Contributing

Feel free to contribute to improve the puzzle solver or report any issues. Pull requests are welcome!
