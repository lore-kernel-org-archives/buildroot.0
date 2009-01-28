From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 28 Jan 2009 09:19:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <87bptrx2xn.fsf@macbook.be.48ers.dk>
References: <20090127151010.080DA7709E@busybox.osuosl.org>
	<20090128081026.55f4a8f8@hcegtvedt>
	<87fxj3x3ou.fsf@macbook.be.48ers.dk>
	<20090128090655.49da87fd@hcegtvedt>
	<87bptrx2xn.fsf@macbook.be.48ers.dk>
Message-ID: <20090128091937.6db2ef12@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Jan 2009 09:14:28 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Hans-Christian> Ah, then the depends on makes sense. There should be
>  Hans-Christian> some comment about why WCHAR is a dependency since
>  Hans-Christian> webkit seems to not need it.
> 
> Sure? Ever tried compiling it without WCHAR? ;)
> 

Qt uses webkit, and AFAIK compiles without WCHAR enabled.

> But yes, we could note that the wchar dependency is because it does
> unicode stuff using the icu library.
> 
> Notice that I can't actually get webkit to build, atleast not with gcc
> 4.3.2 (We my mail to Daniel yesterday), so maybe we should bump the
> version before the release.
> 

FWIW webkit in Qt 4.5 builds with the AVR32 toolchain (gcc 4.2.2 +
vendor patch).

-- 
Best regards,
Hans-Christian Egtvedt
