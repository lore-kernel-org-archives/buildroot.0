From: bert <bert@gtw4c.com>
Date: Sun, 03 May 2015 15:22:04 -0400
Subject: [Buildroot] Buildroot->Raspberry Pi 2 Build Error on
 conftest--Output Does Not Boot.
Message-ID: <5546755C.20204@gtw4c.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Issue Date: 2015.05.03

Build host:  "Linux version 3.19.0-15-generic (buildd at komainu) (gcc 
version 4.9.2 (Ubuntu 4.9.2-10ubuntu13) ) #15-Ubuntu SMP Thu Apr 16 
23:32:37 UTC 2015" running as virtualbox guest on
same OS host. All buildroot-required packages are installed.

Target: Rasperry Pi 2

Reproduce:
1) Clone buildroot from buildroot git repo. 
(git://git.buildroot.net/buildroot, using master branch)
2) cd buildroot
3) make raspberrypi2_defconfig
4) make

No changes were made to any configuration items.  During the build, a 
box indicating the conftest has failed is presented by the build system 
GUI. No 'conftest' executable or script is found.  The system is looking 
for the program at output/build/host.

The resulting output placed on the target does not boot (known good 
hardware).  Both zImage and zImage put through mkknlimg utility fail to 
boot.  All the output products appear to be in the correct location.
