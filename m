From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 20 Jan 2009 12:00:40 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
References: <1232395188.4539.20.camel@elrond.atmel.com>
	<87ljt6xqy3.fsf@macbook.be.48ers.dk>
Message-ID: <AD5651DC396F4490BF04E1FEA1DFE9CA@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Ulf> Anyone beeing able to build "mplayer" at all?
>
> It builds for me on powerpc with the patches I've just comitted (to
> libmad and mplayer).
>
> I've never built it before, and I haven't actually tried running it
> yet (no hw with audio/gfx output available right now).
>
> Ulf> 1: Current mplayer relies on an older version of alsa-lib
> Ulf>    The current version of alsa-lib make some routines "local"
> Ulf>    by statements like:
>
> HcE afaik just fixed that.
>
> Ulf> 2) mplayer do not have any recent "versions".
> Ulf>    Instead you are encouraged to checkout the latest svn.
>
> We could atleast move to 1.0rc2, but after the release please.
>
> I would very much prefer to NOT move to a random svn version.
>
> Ulf> I am not particlary fond of downloading the latest svn,
> Ulf> since that is a recipy for breakage.
> Ulf> I think we should have a recommended version of mplayer
> Ulf> (which we have tested on many architectures)
> Ulf> as well as the capability to checkout the latest.
>
> Wouldn't -rc2 be such a version?
>

"-rc2" is almost as old as "-rc1" and this will not be an update to a 
"release".
The project only supports svn/git and expects people to download
the latest svn which may or may not break, so I think
our only alternative is to select the latest version, test that
and stay with that until we are forced to switch or decide
we want extra functionality.

If the mplayer builds with HCE's patch, then there is no problem
keeping this for the release.

Best Regards
Ulf Samuelsson

> -- 
> Bye, Peter Korsgaard
> 
