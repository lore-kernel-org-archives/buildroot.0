From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 15:33:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1213708213.13476.13.camel@localhost> (Hans-Christian Egtvedt's
	message of "Tue\, 17 Jun 2008 15\:10\:13 +0200")
References: <20080617125437.0554F3C70D@busybox.net>
	<1213708213.13476.13.camel@localhost>
Message-ID: <87y754mbiy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> On Tue, 2008-06-17 at 05:54 -0700, jacmet at uclibc.org wrote:
 >> Author: jacmet

 Hans-Christian> <snipp>

 >> -	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 >> +	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*

 Hans-Christian> $(STRIP_STRIP_UNNEEDED) as well?

Done (r22402).

-- 
Bye, Peter Korsgaard
