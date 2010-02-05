From: Tony Mozi <spooflinux@hotmail.fr>
Date: Fri, 5 Feb 2010 17:15:51 +0100
Subject: [Buildroot] install new module for cross compilation ARM
	(linux-2.6.22.2)
Message-ID: <SNT129-W25FE65519F9A9FF7F5796EB9540@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net







Hi all,
I fight again the buildroot...
I will make the cross compilation of the linux-2.6.22.2 for an arm.

Now, I want install new modules (wifi for example).

I create a directory.
'mkdir -p /home/user/Documents/buildroot-2009.11/output/target/lib/firmware/mrvl'

I copy the files with the extention '.bin' (like wifi.bin for example).

I go to linux-2.6.22.2
'make ARCH=arm all modules_install uImage'
then
I go to buildroot
'make'

and I copy the ext2 to my target.

When I research the 'wifi.ko', there is nothing, the module is not installed.

Have you got a process? Where is my mistake?

BR
 		 	   		  
_________________________________________________________________
Discutez en direct avec vos amis sur Messenger !
http://www.windowslive.fr/messenger
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100205/4b596d99/attachment.htm>
