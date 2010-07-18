From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jul 2010 22:12:44 +0200
Subject: [Buildroot] [git commit master 1/1] dsl: disable ps3 video
	driver
In-Reply-To: <20100718200735.AF6F482BA8@busybox.osuosl.org> (Peter Korsgaard's
	message of "Sun, 18 Jul 2010 21:30:15 +0200")
References: <20100718200735.AF6F482BA8@busybox.osuosl.org>
Message-ID: <87eif0wnur.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@sunsite.dk> writes:

 Peter> commit: http://git.buildroot.net/buildroot/commit/?id=869b11c8b59753ec476a571c8fea8d9574f9b319
 Peter> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 Peter> The ps3 driver is enabled by default on ps3, but depends on spu support,
 Peter> which most ppc toolchains don't have, so disable it.

Sigh, so much for doing too many things in parallel - This was naturally
supposed to be sdl, not dsl - And 'by default on ppc' - Sorry about
that.

-- 
Bye, Peter Korsgaard
