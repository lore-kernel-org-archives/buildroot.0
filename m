From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Feb 2010 16:06:05 +0100
Subject: [Buildroot] buildroot-2009.11 with older kernel
In-Reply-To: <13abadeb1002050323o44703d06k5d1b40f536379fe2@mail.gmail.com>
	(Nuno Pereira's message of "Fri, 5 Feb 2010 11:23:30 +0000")
References: <13abadeb1002050323o44703d06k5d1b40f536379fe2@mail.gmail.com>
Message-ID: <87sk9foh7m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:

 Nuno> Hi all,
 Nuno> Is it possible to use the latest release of buildroot with an
 Nuno> older kernel,
 Nuno> e.g. 2.4.20?

You cannot build the C library with such old kernel headers, but the
resulting rootfs would probably work with the old kernel (unless any of
the packages uses functionality not in 2.4.x ofcourse).

-- 
Bye, Peter Korsgaard
