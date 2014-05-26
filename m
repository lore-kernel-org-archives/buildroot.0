From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 12:23:52 +0200
Subject: [Buildroot] [PATCH 1/1] python2: Fix disabling module bsddb
In-Reply-To: <1400672864-30941-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 21 May 2014 13:47:44 +0200")
References: <1400672864-30941-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wqd8hm87.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Using this minimal defconfig
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_PYTHON=y
 > BR2_PACKAGE_BERKELEYDB=y

 > the current code does not prevent the build of

 > output/build/python-2.7.6/Modules/_bsddb.o

 > because the module is really called _bsddb,
 > see python-2.7.6/Modules/_bsddb.c, line 9604.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
