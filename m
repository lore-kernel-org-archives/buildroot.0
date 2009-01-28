From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 09:14:28 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <20090128090655.49da87fd@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Wed\, 28 Jan 2009 09\:06\:55 +0100")
References: <20090127151010.080DA7709E@busybox.osuosl.org>
	<20090128081026.55f4a8f8@hcegtvedt>
	<87fxj3x3ou.fsf@macbook.be.48ers.dk>
	<20090128090655.49da87fd@hcegtvedt>
Message-ID: <87bptrx2xn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> Ah, then the depends on makes sense. There should be
 Hans-Christian> some comment about why WCHAR is a dependency since
 Hans-Christian> webkit seems to not need it.

Sure? Ever tried compiling it without WCHAR? ;)

But yes, we could note that the wchar dependency is because it does
unicode stuff using the icu library.

Notice that I can't actually get webkit to build, atleast not with gcc
4.3.2 (We my mail to Daniel yesterday), so maybe we should bump the
version before the release.

 >> Applications should select their library dependencies and depend (with
 >> a comment) on toolchain features.

 Hans-Christian> Then I agree that it has to be done like this.

Ok, good.


-- 
Bye, Peter Korsgaard
