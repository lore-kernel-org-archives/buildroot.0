From: Kent <kent@zydax.com>
Date: Mon, 23 Jul 2007 17:20:39 -0700
Subject: [Buildroot] Buildroot Exits Before Linux Compilation
Message-ID: <000001c7cd88$772f1890$6b01a8c0@RANDY>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I?m trying to use Buildroot to compile Linux for use on an Atmel
AT91SAM9260. I?m running buildroot-20070719 on a Fedora core 6, VmWare
Player virtual machine over top of Windows XP. I browsed the settings
available in the menuconfig, chose the arm926t for the target architecture,
chose a couple of options like gdb, pppd, and ?build Linux kernel?, but as
far as I can tell/remember left the rest as defaults.

 

I get an error right as it starts in on the Linux kernel:

 

Make: *** No rule to make target
???/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.patched?, needed by
???/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.configured?. Stop.

 

I don?t know if this is relevant or not, but I do have a

 

?linux-2.6.21.5/.patched?

 

But it?s in:

 

???/buildroot/build_arm/?

 

Not:

 

???/buildroot/project_build_arm/uclibc?

 

I haven?t seen any other posts about this, so I doubt it?s anything wrong
with the code, but I?m really newb enough to have no idea what to tinker
with to get this error to go away. I?m also not sure what other information
I need to include. If I?ve left out something truly vital, please let me
know and I?ll send it out as soon as I can.

 

Thanks a lot for any help anyone can give,

Kent


No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.476 / Virus Database: 269.10.14/912 - Release Date: 7/22/2007
7:02 PM
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070723/9f6a3bf9/attachment.html 
