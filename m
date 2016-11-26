From: Cassiano Martin <cassiano@polaco.pro.br>
Date: Sat, 26 Nov 2016 10:36:04 -0200
Subject: [Buildroot] Request for Help
In-Reply-To: <7E88E7AAEAD14AB9A2F395B26D76F9AF@SYSTEMTECHNIK>
References: <7E88E7AAEAD14AB9A2F395B26D76F9AF@SYSTEMTECHNIK>
Message-ID: <A1610F21-86C3-42E5-87C2-627683FA9291@polaco.pro.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe your kernel is missing can support?  

Enviado do meu iPhone

> Em 26 de nov de 2016, ?s 09:38, BertHuber <3237-15@online.de> escreveu:
> 
> Hello,
> I am new to this mailinglist and also quite new to the buildroot environment.
> I got stuck in my current project with the following problem:
>  
> I am currently trying to build an embedded Linux System with Buildroot.
> 
> It works so far, I get a bootable SD Card for my A20 based board.
> 
> I included all CAN Drivers & protocols I could find (can, can_raw and vcan)
> 
> My problem is : after booting and loggin in as root
> 
> I type:
> 
>  ip link add dev vcan0 type vcan ---- THAT WORKS
> but
> 
>  ip link add dev can0 type can 
> produces:
> 
> RTNETLIINK answers: Operation not supported
> 
> What is wrong ?? Thanks in advance for any ideas.
> 
> Regards
> 
> Bert
> 
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161126/efd39354/attachment.html>
