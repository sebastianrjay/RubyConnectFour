This ConnectFour game and accompanying tests were written by Sebastian Jay on
July 27th, 2015.

To play this game, clink the link at the right to download the ZIP file. Then
unzip the downloaded file. Then open the command line and navigate to the
ConnectFour directory, and run `ruby connect_four.rb` to begin playing.

To run the specs, run `rpsec spec` from the ConnectFour directory. It may be
necessary to install the RSpec gem first, via `gem install rspec` (from any
directory).

Players may define the grid's dimensions and the number of adjacent pieces
required to win the game.

The Board#won? algorithm runs in O(n) time, where n represents the number of
adjacent pieces required for a player to win the game.
