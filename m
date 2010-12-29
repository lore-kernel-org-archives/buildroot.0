From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 22:10:04 +0100
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBB45@EXV1.corp.adtran.com>
	(ANDY KENNEDY's message of "Wed, 29 Dec 2010 15:02:54 -0600")
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
	<20101223082740.3a8e44c4@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
	<20101224090517.0c935c19@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar> <4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBB45@EXV1.corp.adtran.com>
Message-ID: <878vz8jnf7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

Hi,

 ANDY> Okay, that fixed all the toolchain deps.  Everything looks  good in the
 ANDY> new toolchain when compiling with Linux Stable threads, however, it will
 ANDY> not build with Native Posix threads.  I'll work with that later to give
 ANDY> you more information as to what is broken and maybe a way to fix.

Does it break in libc/inet/netlinkaccess.h? Then it might be the same
issue as I recently reported on the uclibc list:

http://lists.uclibc.org/pipermail/uclibc/2010-December/044558.html

-- 
Bye, Peter Korsgaard
