From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 17:28:12 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk><1233005366.2298.118.camel@elrond.atmel.com><871vup4ul9.fsf@macbook.be.48ers.dk><1233008389.2298.129.camel@elrond.atmel.com><87vds114op.fsf@macbook.be.48ers.dk><FE6DCE243B7A4724B6B33E85771AD61F@aeglos><871vumtb1w.fsf@macbook.be.48ers.dk><A223C54B106543948AC36303E7C74F76@aeglos>
	<8763jyrtfb.fsf@macbook.be.48ers.dk>
Message-ID: <69C4B5A4F9B74F77AE1E58B4F020A786@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> >> We already have a situation where more than half the size of buildroot
> >> is patches, continuing to grow this is not a workable situation.
> >>
> Ulf> I agree with this, but the solution I want to see is that you
> Ulf> only keep the latest patches in the tree,
> Ulf> and as we introduce new kernel versions we
> Ulf> let older patches slip into the mirror server.
>
> I don't see why we the buildroot project should mirror random obsolete
> board patches?
>
> And again, things should get pushed upstream so we only carry patches
> for (not-yet-applied-upstream) bugfixes.
>
> Ulf> I just want them to build as long as possible.
>
> Why can't people just continue to use an old buildroot release or
> store their (project specific) board patches outside buildroot?
>
> >> If people want to use an old kernel they can maintain it outside of
> >> buildroot or in their local buildroot tree.
>
> Ulf> I want to give people the capability to build old kernel
> Ulf> with a new root fs.
>
> No problem if we make it possible to get the kernel from somewhere
> else (for most commercial projects probably a local
> cvs/svn/git/whatever repository).
>

As I see it, you get the base kernel from www.kernel.org
and if you dont want to host kernel patches for AT91,  then
it will be no problem to download them from $(ATMEL_MIRROR).
I just think there are other things in higher need of attention
than removing these patches RIGHT NOW.
I see that moving these patches from svn to a mirror should
be done before the next release of buildroot.

> >> I do agree we should make it easier to build u-boot / linux from a
> >> non-mainline svn/git/whatever tree, that's something I will work on
> >> after the release.
>
> -- 
> Bye, Peter Korsgaard
>

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57 
