From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 12:02:38 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <4972ECC6.7010608@ruby.dti.ne.jp> (Shinya Kuribayashi's message
	of "Sun\, 18 Jan 2009 17\:48\:06 +0900")
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<4971FB3A.4050904@ruby.dti.ne.jp> <87fxjh3nhq.fsf@macbook.be.48ers.dk>
	<4972649E.2010609@ruby.dti.ne.jp> <873afh2enj.fsf@macbook.be.48ers.dk>
	<4972ECC6.7010608@ruby.dti.ne.jp>
Message-ID: <87prik27xt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:


 >> Which for a bit of testing seems to be caused by the combination of
 >> -pedantic and -Wno-overlength-strings (any of the two are ok, but the
 >> combination isn't).

 Shinya> Hmm.  Could you give it a try with gcc 4.2.x?

Sure - It builds for me with 4.2.4:

gcc-4.2 --version                                                   ~
gcc-4.2 (GCC) 4.2.4 (Debian 4.2.4-5)
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See http://uclibc.org/~jacmet/br/mips-4.1.log
See http://uclibc.org/~jacmet/br/mips-4.2.log

The gcc 4.1 issue also seems fixable (acx_cv_prog_cc_pedantic__Wno_long_long)

-- 
Bye, Peter Korsgaard
