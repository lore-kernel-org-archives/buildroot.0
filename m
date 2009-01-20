From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 10:33:08 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
In-Reply-To: <1232395188.4539.20.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 19 Jan 2009 20\:59\:47 +0100")
References: <1232395188.4539.20.camel@elrond.atmel.com>
Message-ID: <87ljt6xqy3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Anyone beeing able to build "mplayer" at all?

It builds for me on powerpc with the patches I've just comitted (to
libmad and mplayer).

I've never built it before, and I haven't actually tried running it
yet (no hw with audio/gfx output available right now).

 Ulf> 1: Current mplayer relies on an older version of alsa-lib
 Ulf>    The current version of alsa-lib make some routines "local"
 Ulf>    by statements like:

HcE afaik just fixed that.

 Ulf> 2) mplayer do not have any recent "versions".
 Ulf>    Instead you are encouraged to checkout the latest svn.

We could atleast move to 1.0rc2, but after the release please.

I would very much prefer to NOT move to a random svn version.

 Ulf> I am not particlary fond of downloading the latest svn,
 Ulf> since that is a recipy for breakage.
 Ulf> I think we should have a recommended version of mplayer
 Ulf> (which we have tested on many architectures) 
 Ulf> as well as the capability to checkout the latest.

Wouldn't -rc2 be such a version?

-- 
Bye, Peter Korsgaard
