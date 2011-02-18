From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 17 Feb 2011 18:10:07 -0800
Subject: [Buildroot] First day with buildroot
In-Reply-To: <87bp2a95d1.fsf@macbook.be.48ers.dk>
References: <AANLkTimbBptSub=x_KvcnAt+And2=-NpAPH+m8RR5vmH@mail.gmail.com>
	<1297943420.4856.2.camel@dublxciaranr1.verifone.com>
	<87bp2a95d1.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikkr-9xXZNasdBtxRFtE-k0JLjkUAbPj=_11VDX@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you gentlemen, that completed the build and a new uImage and
rootfs.jffs2 appeared.

A second question if I may.

I selected the general option instead of the e300c2 as my host compiler is
older then required.

Am I correct in assuming that the general option for a MPC8323 (which is an
e300 core) should produce binaries that will run on an MPC8323E-RDB
(Freescale 8323 Reference Design Board) ?

Charles

On Thu, Feb 17, 2011 at 5:07 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Quotient" == Quotient Remainder <quotientvremainder@gmail.com>
> writes:
>
>  Quotient> Ar C?ad, 2011-02-16 at 20:12 -0800, Charles Krinke wrote:
>  Quotient>     Below are the last half dozen lines of my first compile with
> buildroot. I
>  Quotient>     set it up for a powerpc architecture and selected almost all
> the defaults,
>  Quotient>     changing only things like ext2 to jffs2 file system. I did
> select the
>  Quotient>     "general" for sub-architecture (as opposed to say, e300c2).
>  Quotient>     /usr/bin/ld: cannot find -lc
>  Quotient>     --
>
>  Quotient> "sudo yum install glibc-static"
>  Quotient> You need the static C library to build host-module-init-tools
>
> Indeed. Notice that this is a FAQ:
>
> http://buildroot.net/buildroot.html#faq
>
> --
> Bye, Peter Korsgaard
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110217/53f774c0/attachment.html>
