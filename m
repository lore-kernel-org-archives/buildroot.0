From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 13:44:17 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfuse
In-Reply-To: <48D77844.3040602@atmel.com> (Hans-Christian Egtvedt's message of
	"Mon\, 22 Sep 2008 12\:49\:40 +0200")
References: <20080922081105.960D6F8008@busybox.net>
	<48D77844.3040602@atmel.com>
Message-ID: <87wsh4v20e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> +LIBCONFUSE_VERSION:=2.6
 >> +LIBCONFUSE_SOURCE:=confuse-$(LIBCONFUSE_VERSION).tar.gz
 >> +LIBCONFUSE_SITE:=http://bzero.se/confuse/
 >> +LIBCONFUSE_AUTORECONF:=NO
 >> +LIBCONFUSE_INSTALL_STAGING:=YES
 >> +LIBCONFUSE_INSTALL_TARGET:=YES

 Hans-Christian> Can be dropped, this is default.

True. I left it in purely for documentation purposes (E.G. you then
don't need to go lookup what the defaults are).

I can remove it if you feel strongly about it.

-- 
Bye, Peter Korsgaard
