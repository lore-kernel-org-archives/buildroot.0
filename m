From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Tue, 6 May 2008 10:41:39 +0530 (IST)
Subject: [Buildroot] link to busybox
Message-ID: <547821.98673.qm@web94103.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am using buildroot for an arm board. 

Is it common to have all my executables as links to busybox?

eg.
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 freeramdisk -> ../bin/busybox
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 fsck -> ../bin/busybox
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 getty -> ../bin/busybox
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 halt -> ../bin/busybox
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 hdparm -> ../bin/busybox
-rwsr-xr-x 216 tiju users 589352 May  6 10:30 hwclock -> ../bin/busybox

The issue I am facing is that I am not able to get the shell prompt. It keeps on respawning the getty when I try to login.

Thanks in advance.
Tiju


      Meet people who discuss and share your passions. Go to http://in.promos.yahoo.com/groups/bestofyahoo/
