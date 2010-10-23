From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 23 Oct 2010 04:32:58 -0400
Subject: [Buildroot] [git commit master 1/1] toolchain: do not require
	full path
In-Reply-To: <87tykdcsma.fsf@macbook.be.48ers.dk>
References: <20101016204702.67E958D282@busybox.osuosl.org>
	<871v7pet77.fsf@macbook.be.48ers.dk>
	<201010221719.23905.vapier@gentoo.org>
	<87tykdcsma.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTinktTTjKWoJSy16bka6o7Q1dim2O6Fy8_AFEm6j@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 23, 2010 at 2:47 AM, Peter Korsgaard wrote:
>>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>
> ?Mike> On Saturday, October 16, 2010 17:14:20 Peter Korsgaard wrote:
> ?>> Thanks, but please don't commit to the buildroot tree directly. We use a
> ?>> setup like the kernel, so send patches/pull requests like everyone else.
>
> ?Mike> what about branches ? ?i dont see a problem with letting people
> ?Mike> create/maintain/push their own branches.
>
> Sure, but in their own trees, not in the official buildroot tree.
>
> Again, just like it's done for the kernel and other proects.

not really.  there are plenty of examples where people are allowed to
maintain their own branch in the same "master" tree.  uClibc, glibc,
OE off the top of my head.
-mike
