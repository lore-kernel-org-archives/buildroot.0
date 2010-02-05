From: Nuno Pereira <fxss@iol.pt>
Date: Fri, 5 Feb 2010 17:03:32 +0000
Subject: [Buildroot] buildroot-2009.11 with older kernel
In-Reply-To: <87sk9foh7m.fsf@macbook.be.48ers.dk>
References: <13abadeb1002050323o44703d06k5d1b40f536379fe2@mail.gmail.com>
	<87sk9foh7m.fsf@macbook.be.48ers.dk>
Message-ID: <13abadeb1002050903g78e190a7n4c12d475f2277ca5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 February 2010 15:06, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:
>
>  Nuno> Hi all,
>  Nuno> Is it possible to use the latest release of buildroot with an
>  Nuno> older kernel,
>  Nuno> e.g. 2.4.20?
>
> You cannot build the C library with such old kernel headers, but the
> resulting rootfs would probably work with the old kernel (unless any of
> the packages uses functionality not in 2.4.x ofcourse).
>
> --
> Bye, Peter Korsgaard
>

But I just want to build a toolchain for C/C++ for powerpc to be possible to
run some code under 2.4.20 kernel.

Regards,
Nuno
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100205/a2ab468f/attachment.htm>
