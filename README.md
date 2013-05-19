canary
=========

A small bash script that throttles down a process when Core 1 temperature exceeds certain threshold.

I originally coded it to throttle minerd when CPU mining YaCoins.

## Usage

Specify the process name after "-e" in this line:

cpulimit -e minerd -l 99 -b > /dev/null 2>&1;

Modify this with your temperature threshold as output by the "sensors" command:

$t &gt;= 65 and $t &lt; 65

You may need to install first cpulimit. There's still a cpulimit bug that makes values over 100% not work, even though a process may have more than 100% in a multicore CPU, so for now the throttling is either "Full" or "Whatever 99% means in your system"

## Known bugs

cpulimit may be left running after interrupting the script. Do killall cpulimit after to make sure it's dead.

## To Do

1. Make it check all cores
2. Accept a process name as argument
3. Terminate cleanly with the Q key (killing cpulimit so it's not left running)
