From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jul 2009 22:45:05 +0200
Subject: [Buildroot] [PATCH] linux26: do not set CFLAGS_KERNEL to
	TARGET_CFLAGS
In-Reply-To: <1248265505-25870-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Wed\, 22 Jul 2009 14\:25\:05 +0200")
References: <87bpncdimz.fsf@macbook.be.48ers.dk>
	<1248265505-25870-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <873a8ocur2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Using TARGET_CFLAGS breaks the kernel build for the arm platform. The
 Sven> result is a kernel that can not be booted. So simply do not fiddle with
 Sven> the CFLAGS on a kernel build and the kernel build system will do the
 Sven> right thing (TM).

Thanks, applied.

I did the same thing for the standard kernel compilation mode as well.

-- 
Bye, Peter Korsgaard
