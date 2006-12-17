From: Michel Benoit <murpme@gmail.com>
Date: Sun, 17 Dec 2006 20:44:32 +0100
Subject: [Buildroot] Compiling and loading modules
Message-ID: <c88e466f0612171144s2817fdddj386aa2df78988edb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot to build and run a Linux 2.6.19 kernel and root
file system.
The kernel compiles and runs ok and (at this stage) I am using the
root.arm.ext2 file as an initrd root fs in ram. My target is an arm
atmel cpu (AT91SAM9260).

I am trying to build and load a simple hello world kernel module.
I build the module from the same tree as the linux kernel but when I
run ismod I get the message "Illegal Instruction".  I get the same
response when I try to insmod other kernel modules built automatically
in the tree.

What can be the cause of the "Illegal instruction"?
Does this indicate that I am not cross compiling correctly?
Is the ko object corrupt or in the wrong format (endianess perhaps)?

I am using modutils from busybox. Are there any busybox options that need to be
added/removed? I have tried enabling module config options in busybox
and the kernel but I always get the same error.

It feels like this is a build issue but I can't see why the kernel
builds ok but the modules don't.

Thanks,

Michel
