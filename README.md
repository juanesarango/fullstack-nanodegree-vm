Swiss-System Tournament 
=============

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible. This project is done for fullstack-nanodegree of udacity.

# Setup
For running up this project you will need to have installed [virtual box](https://www.virtualbox.org/) and [vagrant](https://www.vagrantup.com/).

First, inside the `/vagrant` folder setup a machine by running `vagrant up`. This will use the parameters specified in the `Vagrantfile`.
Here with the `psql` tool a database named `tournament` will be created, and the file `tournament/tourament.sql` where the schema is defined is run, which will create tables for players and matches, and some intermediate views to obtain the players standings.

The template file `tournament.py` is where are located the functions of the module. In this file you’ll see stubs of several functions. Each function has a docstring that says what it should do.

Finally, the file `tournament_test.py` contains unit tests that test the functions written in tournament.py. You can run the tests from the command line, using the command `python tournament_test.py`.


## Functions in tournament.py

### registerPlayer(name)
Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

### countPlayers()
Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

### deletePlayers()
Clear out all the player records from the database.

### reportMatch(winner, loser)
Stores the outcome of a single match between two players in the database.

### deleteMatches()
Clear out all the match records from the database.

### playerStandings()
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

### swissPairings()
Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.
