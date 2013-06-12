From: Ryan Wilkins <ryan@deadfrog.net>
Date: Wed, 12 Jun 2013 00:18:46 -0400
Subject: [Buildroot] Unable to open switchtest device
Message-ID: <D82259C7-D19C-4A4A-A5E6-E35B62A8F550@deadfrog.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All.

I'm fairly new to buildroot but do have it running on a x86 platform.  Buildroot release 2013.05.  I need Xenomai and have compiled in Xenomai 2.6.2.1 with Linux Kernel 3.5.7.  The processor is a Core 2 Quad and the kernel was initially compiled for x86_64 but recompiled for i386 with no change in outcome.  I am using a custom kernel configuration which is referenced in the buildroot "Kernel" configuration menu.

The issue that I'm experiencing is with running the 'xeno-test' command and it failing with a "Unable to open switchtest device" message.  I've checked around in the archives and couldn't find anything that was useful to solving my situation.  Running the latency test command by itself works so I know Xenomai is working but it's just unable to complete the xeno-test commands.  Can anyone suggest some direction to look in to hopefully solve the issue with the switchtest device?

Thanks much!

Ryan Wilkins
