From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jan 2012 21:34:05 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB457908.2D7A%donald.poole@swri.org> (Donald R. Poole's message
 of "Wed, 25 Jan 2012 15:16:57 +0000")
References: <CB457908.2D7A%donald.poole@swri.org>
Message-ID: <87hazj4j42.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

 Peter> Ok, and how do you boot the system, what kind of filesystem output are
 Peter> you using?

 Donald> I am booting the kernel with u-boot (Freescales u-boot for
 Donald> i.MX53 processors version rel_imx_2.6.35_11.01.00) with the
 Donald> boot arguments

 Donald> console=ttymxc0,115200 video=mxcdi1fb:GBR24,XGA di1_primary tve
 Donald> root=/dev/mmcblk0p1 rw rootwait rootflags=barrier=1

Ok, good. How do you create the file system on the SD card exactly?

-- 
Bye, Peter Korsgaard
