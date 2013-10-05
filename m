From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Oct 2013 20:13:37 +0200
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <2072070.rCLOs5ZVTX@asici> ("Fatih =?utf-8?B?QcWfxLFjxLEiJ3M=?=
 message of "Sat, 05 Oct 2013 13:21:27 +0300")
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <4620256.4JgqIslJcA@asici> <87mwmohyie.fsf@dell.be.48ers.dk>
 <2072070.rCLOs5ZVTX@asici>
Message-ID: <87ioxbio1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

Hi,

 >> So it looks for uImage and .dtb files in rootfs:/boot? That sounds fine,
 >> as that's where we're installing them.

 Fatih> That's true; but we should enable
 Fatih> BR2_LINUX_KERNEL_INSTALL_TARGET in defconfig too. It is not
 Fatih> enabled by default.

Sure, for the places where it makes sense (like on beaglebone).

-- 
Bye, Peter Korsgaard
