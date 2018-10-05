# cgroup demo

This demo displays the power of cgroups in the Linux kernel and how they can be implemented to protect your system from rogue processes.

**run.sh** 

 1. This script creates a demo to the heiarchy under the cgroup memory.
 2. Set a memory limit of 100MB 
 3. Turn off swap for this cgroup

**add-to-cgroup.sh**

 1. Add the pid for the current shell to the cgroup created above

**mem-leak.py**
This script is an infinite loop that grabs 10MB of RAM with each iteration. When it is ran prior to running add-to-cgroup or manually adding the pid to the appropriate cgroup the script will run until it crashes you machine. Once the pid is of the session is added the script will be killed automatically when the memory used by the shell and the script break 100MB.
 
**Demo**

sudo ./run.sh
sudo ./add-to-cgroup $$
sudo ./cleanup.sh
