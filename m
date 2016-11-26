From: BertHuber <3237-15@online.de>
Date: Sat, 26 Nov 2016 14:06:24 +0100
Subject: [Buildroot] Request for Help
In-Reply-To: <A1610F21-86C3-42E5-87C2-627683FA9291@polaco.pro.br>
References: <7E88E7AAEAD14AB9A2F395B26D76F9AF@SYSTEMTECHNIK>
 <A1610F21-86C3-42E5-87C2-627683FA9291@polaco.pro.br>
Message-ID: <4529057BDF884FF2B52D801FE76F691B@SYSTEMTECHNIK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't beleive so, as I said, I selected every configuration item that has
anything to do
with CAN, also I explicitly selected the A20 CAN Driver in the Kernel.

 
  _____  

Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von
Cassiano Martin
Gesendet: Samstag, 26. November 2016 13:36
An: BertHuber
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Request for Help


Maybe your kernel is missing can support?  

Enviado do meu iPhone

Em 26 de nov de 2016, ?s 09:38, BertHuber <3237-15@online.de> escreveu:



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

 

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161126/30af02f4/attachment.html>
