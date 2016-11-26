From: BertHuber <3237-15@online.de>
Date: Sat, 26 Nov 2016 12:38:01 +0100
Subject: [Buildroot] Request for Help
Message-ID: <7E88E7AAEAD14AB9A2F395B26D76F9AF@SYSTEMTECHNIK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am new to this mailinglist and also quite new to the buildroot
environment.
I got stuck in my current project with the following problem:
 
I am currently trying to build an embedded Linux System with Buildroot. 

It works so far, I get a bootable SD Card for my A20 based board. 

I included all CAN Drivers & protocols I could find (can, can_raw and vcan) 

My problem is : after booting and loggin in as root

I type:

 ip link add dev vcan0 type vcan ---- THAT WORKS



but

 ip link add dev can0 type can 



produces:

RTNETLIINK answers: Operation not supported

What is wrong ?? Thanks in advance for any ideas.

Regards

Bert

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161126/e3d64902/attachment.html>
