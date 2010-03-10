From: Tony Mozi <spooflinux@hotmail.fr>
Date: Wed, 10 Mar 2010 14:11:35 +0100
Subject: [Buildroot] Modify the arm-linux-gdb target
Message-ID: <SNT129-W472DD241AC959D157E2DB8B9330@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net












Hi,
I try to change the target of arm-linux-gdb which is intalled by the buidroot.

By default : 
GNU gdb 6.8
This GDB was configured as "--host=i386-pc-linux-gnu --target=arm-linux-uclibc".

In menuconfig, I have not found any option in order to modify it.

I need to modify the --target=arm-linux-uclibc by --target=arm-linux.
Thank to this change, sim (simulation) will be available for ARM.

How can I do it?

BR
 		 	   		  
_________________________________________________________________
Consultez vos emails Orange, Gmail, Yahoo!, Free ... directement depuis HOTMAIL !
http://www.windowslive.fr/hotmail/agregation/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100310/94a641cc/attachment.htm>
