From: Marko Stanisic <sankerspace@gmail.com>
Date: Thu, 8 Apr 2021 15:41:55 +0200
Subject: [Buildroot] - Question: How to change safely /var/log --> /tmp in
 buildroot
Message-ID: <c2d6ee0a-995c-b403-b21c-2dd642104c6b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have no clue how? the symlink? /var/log --> ../tmp is statically 
defined. (in buildroot)

I need? to change this behaviour safely, so that /var/log is mounted 
onto our log partition, i already tried the following:

 ??? mount /dev/mmcblk0p9 /var/log

but then (due to the symlink) /dev/mmcblk0p9 is mounted on /tmp ,and the 
mount to the tmpfs (RAM) is vanished.


Is there maybe a better solution (best practice) to solve that problem?

Thank you for every proposal,

Marko Stanisic
