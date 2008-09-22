From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 17:15:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfuse
In-Reply-To: <48D785BB.6040906@atmel.com> (Hans-Christian Egtvedt's message of
	"Mon\, 22 Sep 2008 13\:47\:07 +0200")
References: <20080922081105.960D6F8008@busybox.net>
	<48D77844.3040602@atmel.com> <87wsh4v20e.fsf@macbook.be.48ers.dk>
	<48D785BB.6040906@atmel.com>
Message-ID: <87wsh4rz36.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> It is more what the norm is for Buildroot. Should we
 Hans-Christian> keep the DEPENDENCIES in even if it is just uClibc?
 Hans-Christian> There is nothing specific about this in the
 Hans-Christian> Makefile.autotools.in, so perhaps we can have a short
 Hans-Christian> discussion here to settle it once and for all?

I wouldn't mind dropping the uclibc dependencies, but the
INSTALL_{TARGET,STAGING} defaults are probably a bit too hard for
people to remember/understand.

 Hans-Christian> IMHO it is fine to keep it in, but the makefile looks
 Hans-Christian> more tidy the less there is in it. Perhaps better to
 Hans-Christian> add some documentation to Makefile.autotools.in about
 Hans-Christian> _DEPENDENCIES that uclibc is default.

Yeah, that would be good.

-- 
Bye, Peter Korsgaard
