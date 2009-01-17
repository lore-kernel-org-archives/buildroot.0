From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jan 2009 17:29:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <4971FB3A.4050904@ruby.dti.ne.jp> (Shinya Kuribayashi's message
	of "Sun\, 18 Jan 2009 00\:37\:30 +0900")
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<4971FB3A.4050904@ruby.dti.ne.jp>
Message-ID: <87fxjh3nhq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:

 >> -	default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
 >> +	default BR2_GCC_VERSION_4_3_2 if !BR2_avr32
 >> default BR2_GCC_VERSION_4_2_3 if BR2_avr32
 >> help
 >> Select the version of gcc you wish to use.

 Shinya> GCC 4.3.2 bootstrap failed;  mips, mips4 and o32 on Ubuntu 8.04.01.

Strange, mips worked here (Debian)

uclibc.org/~jacmet/br/mips.log

And 4.2.4 works for you?

-- 
Bye, Peter Korsgaard
