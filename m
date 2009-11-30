From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Nov 2009 09:10:04 +0100
Subject: [Buildroot] Failed to run init
In-Reply-To: <156139.50263.qm@web52407.mail.re2.yahoo.com> (Joo Aun Saw's
	message of "Sun\, 29 Nov 2009 22\:13\:39 -0800 \(PST\)")
References: <156139.50263.qm@web52407.mail.re2.yahoo.com>
Message-ID: <87vdgszb4z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joo" == Joo Aun Saw <jasaw81@yahoo.com.au> writes:

 Joo> Hello,
 Joo> I'm using buildroot version 2009.08, target CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ).

 Joo> I want to run linux from a ramdisk but it is not able to run the init file. I mounted the ramdisk on my host machine and the init file is in /sbin/init which points to ../bin/busybox. Any help would be greatly appreciated.

 Joo> Failed to execute /sbin/init.  Attempting defaults...
 Joo> Kernel panic - not syncing: No init found.  Try passing init= option to kernel.

Do you have BR2_SOFT_FLOAT enabled in your buildroot .config? If not
(you should), do you have FPU emulation enabled in the kernel?

-- 
Bye, Peter Korsgaard
