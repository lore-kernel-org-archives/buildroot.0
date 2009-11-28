From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 20:06:49 +0100
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911280943.16819.minimod@morethan.org> (Michael S. Zick's
	message of "Sat\, 28 Nov 2009 09\:43\:14 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<200911280813.12919.minimod@morethan.org>
	<200911280935.57255.minimod@morethan.org>
	<200911280943.16819.minimod@morethan.org>
Message-ID: <87ljhq4gfq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> After disabling eject/eject-scsi support. . .
 Michael> Looks like it has a dependency on jffs2:

 Michael>   CC      miscutils/flash_lock_unlock.o
 Michael> miscutils/flash_eraseall.c:15:28: error: mtd/jffs2-user.h: No such file or directory

That's fixed by 4e385ee7 - Are you sure your tree is uptodate?

-- 
Bye, Peter Korsgaard
