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

::::::::::::::::::::::::::::::::::::::: callout

#### Byobu Basics

The screen should look like this:

Should your SSH session on Nectar terminate, once you log back in to your Nectar instance, list running sessions/screens:
```bash
byobu-screen -ls
```
If it says (Detached) next to the `workshop` session in the list, reattach to `workshop` by:
```bash
byobu-screen -r workshop
```
If it says (Attached) next to the `workshop` session in the list, you can access the `workshop` session which is already attached by:
```bash
byobu-screen -r -d workshop
```
Some other useful `byobu-screen` commands:

To detach from `workshop`, type `ctrl-a ctrl-d` while inside the `workshop` session. (You will need to configure Byobu’s ctrl-a behaviour if it hasn’t already been configured (text will appear on the screen telling you this). Follow the information on the screen and select `1` for Screen mode).

To terminate `workshop`, type `ctrl-d` while inside the `workshop` session.

::::::::::::::::::::::::::::::::::::::::::::::

## Tutorial setting

The setting for this tutorial is as follows: you receive some germline sequencing data from an individual [NA12878](https://www.internationalgenome.org/data-portal/sample/NA12878) (chr20 from sample NA12878 is sourced from the International Genome Sample Resource). Your aim is to identify small genetic variants from this data.

## The Genome Analysis Toolkit (GATK)

GATK is the industry standard toolkit for analysis of germline DNA to identify SNVs and indels. The GATK tool is mainly designed fo the human whole genome and exome analysis. The current version (GATK4) has expanded scope now and includes more complex analysis such copy number (CNV), structural variant (SV) and somatic variants. The current version of GATK also includes several utility functions for processing alignment files, VCF files and other complex processing workflows. The Picard toolkit is also now incorporated with GATK4. Van der Auwera GA & O’Connor BD. (2020). Genomics in the Cloud: Using Docker, GATK, and WDL in Terra (1st Edition). O’Reilly Media.

## Additional Information

To copy data from the remote workshop computer to your local computer.

Command line/Mac Users

The syntax to do this depends on whether you are running the copying command on your local computer, or on the remote computer (Nectar cloud).

1. When running the command from your local computer, the syntax for copying a file from Nectar is:
```bash
scp username@nectar_IP_address:FILENAME /PATH/TO/TARGET/FOLDER/
```
2. Running the command on the remote computer, the syntax for copying a file to your local computer is:
```bash
scp FILENAME username@your_IP_address:/PATH/TO/TARGET/FOLDER/
```

SFTP clients

Using WinSCP or FileZilla or CyberDuck you will need the following details to connect and browse.

1. Host: The IP address of the Nectar instance
2. Username:
3. Port:



