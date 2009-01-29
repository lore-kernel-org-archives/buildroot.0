From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 29 Jan 2009 07:15:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
In-Reply-To: <873af3v3ru.fsf@macbook.be.48ers.dk>
References: <20090128153542.0132D769CC@busybox.osuosl.org>
	<873af3v3ru.fsf@macbook.be.48ers.dk>
Message-ID: <20090129071537.5f22f517@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Jan 2009 16:39:17 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "laird" == laird  <laird@uclibc.org> writes:
> 
>  laird> Author: laird
>  laird> Date: 2009-01-28 15:35:39 +0000 (Wed, 28 Jan 2009)
>  laird> New Revision: 25102
> 
>  laird> Log:
>  laird> autoconf.mk: Bounce version to 2.63
> 
>  laird> Have been having various issues with multiple jobs (-jX) and
>  laird> building autoconf.  Turns out that v2.63 has fixed this.  So
>  laird> bounce version to a working version.
> 
> Ok, let's give it a good shake to see if anything breaks with this.
> 

Please note that autoconf 2.63 is not compatible with autoconf 2.61, at
least from my experience. So I say all packages should be configured
and built to test if this is working as expected.

And since we're already touching autoconf, install it to
toolchain_build_ARCH/bin as well? (-:

-- 
Best regards,
Hans-Christian Egtvedt
