From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2014 13:47:56 +0100
Subject: [Buildroot] Buildroot, adding kernel module
In-Reply-To: <af09904.1ffcd5c3.52cbea89.1ac6b@o2.pl> (makowski pawel's message
 of "Tue, 07 Jan 2014 12:52:41 +0100")
References: <af09904.1ffcd5c3.52cbea89.1ac6b@o2.pl>
Message-ID: <87txdgvtz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "makowski" == makowski pawel <makowski.pawel@o2.pl> writes:

Forwarding to the buildroot list, please use buildroot at busybox.net in
the future.

 > Hello everyone,
 > I'm trying to add a new kernel module to the /Buildroot/. In my
 > understanding, the best way to that is to add it into the /Sample Kernel

 > Code /section in Kernel configuration. I performe following steps:
 > 1. I put your example /mykmod.c/ file to
 > //output/build/linux_xyz///samples/mykmod /directory.
 > 2. I create Makefile for it: /obj-$(CONFIG_SAMPLE_MYKMOD) += mykmod.o/
 > 3. I add the new section to /KConfig /in samples directory.
 > When I run the /make linux-menuconfig/ a new module is visible. I
 > checked it to the build,
 > and I see it builds.
 > I download Kernel image and RootFs to the target and I can't find the
 > module file.
 > What could be wrong ?

 > --
 > Regards/Pozdrawiam
 > Pawe? Makowski

-- 
Bye, Peter Korsgaard
