# cfs-testing-cloudlab-profile

For use with [CloudLab](https://cloudlab.us/).
For more details on the project,
please read [this report](https://apps.cs.utexas.edu/apps/sites/default/files/tech_reports/load_balance_cx_synthesis.pdf).

## Usage

Create a CloudLab profile based on this one.
Instructions for how to do this can be found [here](https://docs.cloudlab.us/creating-profiles.html#%28part._copying-a-profile%29).
When an experiment is created using this profile,
it will automatically run `./setup.sh`.

Next,
log into the experiment once it has finished setting up.
Note that the `wget` call to download `d.q` occasionally fails,
so rerun the command if `d.q` is not present.
Then,
you can run `./run-test.sh <topology> <task> <user-number>` to run a test on that user.
The user will be automatically created if it does not exist already.

Currently,
the valid topologies are 
 - `N` (where N is some positive integer), a flat topology of N cores.
   For example,
   `2` is the topology with 2 cores.
 - `16-tiered`, which is a two-layer topology with 4 groups of 4 cores.
More can be added by modifying the run script [here](https://github.com/fishy15/linux-cfs-testing/blob/master/run.shhttps://github.com/fishy15/linux-cfs-testing/blob/master/run.sh).

The only tasks currently is `crunch N`, where N is some positive integer.
This spawns N threads which do some computation in parallel.
To add more tasks,
add an executable for the task in the `d.q` image.
The task specified is called through `ssh` while the `d.q` image is running,
as can be seen here in the [`swk` source code](https://github.com/fishy15/linux-cfs-testing/blob/master/swk.c).

The resulting JSON file will be found under `/mydata/user-#/0.txt`.
This script always copies data from core 0.
