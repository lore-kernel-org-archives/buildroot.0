From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Oct 2010 10:46:39 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: do not require
	full path
In-Reply-To: <AANLkTinktTTjKWoJSy16bka6o7Q1dim2O6Fy8_AFEm6j@mail.gmail.com>
	(Mike Frysinger's message of "Sat, 23 Oct 2010 04:32:58 -0400")
References: <20101016204702.67E958D282@busybox.osuosl.org>
	<871v7pet77.fsf@macbook.be.48ers.dk>
	<201010221719.23905.vapier@gentoo.org>
	<87tykdcsma.fsf@macbook.be.48ers.dk>
	<AANLkTinktTTjKWoJSy16bka6o7Q1dim2O6Fy8_AFEm6j@mail.gmail.com>
Message-ID: <87lj5pcn4g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 >> Again, just like it's done for the kernel and other proects.

 Mike> not really.  there are plenty of examples where people are allowed to
 Mike> maintain their own branch in the same "master" tree.  uClibc, glibc,
 Mike> OE off the top of my head.

True. Again, we use the approach of the Linux kernel (and copied by
u-boot, barebox, ..).

-- 
Bye, Peter Korsgaard
