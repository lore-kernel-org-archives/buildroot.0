From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 16:54:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <COL102-DS10B32A6F03C4C2B946F2DBDCCB0@phx.gbl> (Daniel Laird's
	message of "Tue\, 27 Jan 2009 15\:29\:20 +0000")
References: <20090127150231.1A65F7709E@busybox.osuosl.org>
	<COL102-DS10B32A6F03C4C2B946F2DBDCCB0@phx.gbl>
Message-ID: <87r62ozqv4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <danieljlaird@hotmail.com> writes:

 Daniel> My only concern with all these changes is currently external toolchain has
 Daniel> no support for setting

 Daniel> BR2_ENABLE_LOCALE or BR2_USE_WCHAR.  However I can build
 Daniel> these packages.

I'm not familiar with the external toolchain stuff, but don't you
already now need to configure buildroot to match the toolchain
settings (ipv6, largefile, locales, c++ support and so on?). If not,
how is that handled?

 Daniel> It would seem a shame to break external toolchain support at
 Daniel> this late hour....

I guess it's already broken then ;) There's several packages depending
on locales/c++/wchar stuff.

-- 
Bye, Peter Korsgaard
