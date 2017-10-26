From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 12:18:45 +0200
Subject: [Buildroot] Multiple root filesystems for single
	kernel/toolchain
In-Reply-To: <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be> (Arnout
 Vandecappelle's message of "Mon, 23 Oct 2017 22:23:10 +0200")
References: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
 <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
Message-ID: <87po9a2ovu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  However, if all you need is a to toggle a few bits and to wait until the device
 > is available, you might even get away with a simple C program that does that,
 > mounts the rootfs, does a pivot_root(), and exec()s /sbin/init. Then you make a
 > cpio archive with just that executable. Perhaps more work but you're very sure
 > that it's small :-)

Or alternatively do it in the boot loader if it is so simple.

-- 
Bye, Peter Korsgaard
