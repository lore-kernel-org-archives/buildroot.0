From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 09:30:29 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <20090128091937.6db2ef12@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Wed\, 28 Jan 2009 09\:19\:37 +0100")
References: <20090127151010.080DA7709E@busybox.osuosl.org>
	<20090128081026.55f4a8f8@hcegtvedt>
	<87fxj3x3ou.fsf@macbook.be.48ers.dk>
	<20090128090655.49da87fd@hcegtvedt>
	<87bptrx2xn.fsf@macbook.be.48ers.dk>
	<20090128091937.6db2ef12@hcegtvedt>
Message-ID: <877i4fx26y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> Sure? Ever tried compiling it without WCHAR? ;)
 >> 

 Hans-Christian> Qt uses webkit, and AFAIK compiles without WCHAR enabled.

How? Without using libicu? I know close to nothing about webkit.

 Hans-Christian> FWIW webkit in Qt 4.5 builds with the AVR32 toolchain
 Hans-Christian> (gcc 4.2.2 + vendor patch).

The webkit version we have in BR (some svn nightly) most likely also
built at some time, but I know from other C++ projects that gcc 4.3.x
cleaned up quite some stuff and got more strict.

-- 
Bye, Peter Korsgaard
