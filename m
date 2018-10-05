From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 14:08:11 +0200
Subject: [Buildroot] [PATCH] xlib_libxshmfence: drop AUTORECONF
In-Reply-To: <20180923133759.30626-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 23 Sep 2018 15:37:59 +0200")
References: <20180923133759.30626-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k1mw4mvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 2524acd4179fccc627a72ff188bf51c95fed9876
 > ("package/x11r7/xlib_libxshmfence: bump version to 1.3"), the patch
 > 0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch was dropped, but
 > the corresponding AUTORECONF = YES was not dropped.

 > This causes a build issue if just xlib_libxshmfence is built (using
 > "make xlib_libxshmfence" or using per-package host/target directories):

 >>>> xlib_libxshmfence 1.3 Autoreconfiguring
 >   configure.ac:40: error: must install xorg-macros 1.3 or later before running autoconf/autogen
 >   configure.ac:40: the top level

 > This commit fixes that by dropping the no longer needed
 > AUTORECONF = YES.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
