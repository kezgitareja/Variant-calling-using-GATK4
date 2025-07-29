---
title: Setup
---

## Requirements & Preparation

::::::::::::::::::::::::::::::::::::::: callout

#### Important

Attendees are required to use their own laptop computers.

At least one week before the workshop, if required, participants should install the software below. This should provide sufficient time for participants to liaise with their own IT support should they encounter any IT problems.

::::::::::::::::::::::::::::::::::::::::::::::

## Software Setup

:::::::::::::::: spoiler

### Windows

1. A terminal emulator such as [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) will need to be downloaded.
2. Software for file transfers between a local computer and remote server such as [WinSCP](https://winscp.net/eng/index.php) or [FileZilla](https://filezilla-project.org/).

::::::::::::::::::::::::

:::::::::::::::: spoiler

### MacOS

No additional software needs to be installed for this workshop.

::::::::::::::::::::::::

## Data

All required data will be made available on the workshop virtual machines (hosted at the Melbourne Research Cloud). Login details will be provided closer to the tutorial data.

## Mode of Delivery

This workshop will be run on a [Nectar](https://ardc.edu.au/services/ardc-nectar-research-cloud/) Instance. An “Instance” is Nectar terminology for a virtual machine running on the Nectar Cloud OpenStack infrastructure. An “Instance” runs on a “compute node”; i.e. a physical computer populated with processor chips, memory chips and so on.

You will be given an individual username, IP address and password to log on to using the SSH client tool on your computer (Terminal on Mac or PuTTY on Windows).

```bash
ssh username@ip-address
```

## Byobu-screen

Some of the commands in this tutorial take a while to run. Should your ssh connection drop and the SSH session on Nectar terminates, any commands that are running will terminate too. To mitigate this, once logged on to the Nectar Instance, we’ll run `byobu-screen` (an enhancement for the `screen` terminal multiplexer) which allows us to resume a session. In other words, processes running in `byobu-screen` will continue to run when their window is not visible, even if you get disconnected.

On Nectar, to start a `byobu-screen` session called `workshop`, type:
```bash
byobu-screen -S workshop
```

You can then proceed to run the commands in the workshop as normal.










