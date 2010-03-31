From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 31 Mar 2010 20:11:14 +0200
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <x2g478c82f01003310848x8e42f326v263e14193e0972a6@mail.gmail.com>
	(Alexander Sirotkin's message of "Wed, 31 Mar 2010 18:48:04 +0300")
References: <4BB20A06.1090407@browserseal.com> <4BB2794A.3030400@free.fr>
	<j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>
	<hovmml$391$1@dough.gmane.org>
	<x2g478c82f01003310848x8e42f326v263e14193e0972a6@mail.gmail.com>
Message-ID: <87mxxo8ipp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander (Sasha) Sirotkin <buildroot@browserseal.com> writes:

 Alexander> I did not manage to compile crosstoll-ng with eglibc yet. It
 Alexander> looks like eglibc support is broken in crosstool-ng and
 Alexander> glibc support is broken in buildroot.

uClibc? We don't have glibc support (except for external toolchains), so
it cannot really be broken ;)

-- 
Bye, Peter Korsgaard
