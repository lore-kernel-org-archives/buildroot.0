From: errico at inwind.it <errico@inwind.it>
Date: Wed,  5 Nov 2008 14:58:09 +0100
Subject: [Buildroot] rfs in ram and /usr in nand
Message-ID: <K9V5GX$486F9A1842AD629D855B941DB26F75D7@libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

       I am new to the list and I am a new buildroot user.
I just started using buildroot and it's very usefull.
I am porting linux on a proprietary board based on ARM AT91sam9260.

I need some help to configure buildroot so that I will have a root file sistem on a ramdisk and the /usr directory in nand.
I need the jffs2 format so that I can program the nand with Atmel Sam-ba.
At the moment I am able to get from buildroot the rfs in 2 formats: ramdisk and jffs2.

How can I program the nand partition table?
I would like to get following 6 partitions:
- AT91boot
- uboot
- uboot env variables
- linux kernel
- ramdisk
- usr

Any help or hint is wellcome.

Thank you 

Errico
