From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Wed, 27 Jan 2010 07:28:28 -0800 (PST)
Subject: [Buildroot] Buildroot How-To for QEMU/ARM
Message-ID: <413172.3712.qm@web44802.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
?
I can build qemu-0.12.2 under Ubuntu 9.10 and boot Linux in QEMU using the pre-built kernel and RFS in arm-test-0.2, also from the QEMU project.
?
Now I want to use QEMU to boot a Linux kernel and RFS that I built myself for ARM using buildroot-2009.11.
?
I have not had much luck. Based on web searching, I have tried twisting knobs in 'make menuconfig' and rebuilt perhaps a couple of dozen times.
?
Rather than do a core dump here of the details, I thought I would ask:
?
Has anyone used buildroot-2009.11 to build a kernel and RFS for ARM that boot successfully under qemu-0.12.2?
?
Do step-by-step notes exist for how to do this for ARM that were written for these latest versions of Buildroot and QEMU, or that have been verified as still complete and correct?
?
Ultimately, I might like to get Buildroot/QEMU working for a particular ARM processor, but for now, a working configuration for any virtualized ARM target is good enough.
?
A general purpose Buildroot/QEMU howto for ARM might serve as both a worthwhile regression test, and primary support document visible at the Buildroot web site.
?
Thanks.
?
Jim


      
