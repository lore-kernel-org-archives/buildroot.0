From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 00:12:09 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libXfont2: work around
 gcc bug 85180
In-Reply-To: <20190712090407.54154-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Fri, 12 Jul 2019 11:04:07 +0200")
References: <20190712090407.54154-1-giulio.benetti@micronovasrl.com>
Message-ID: <87a7ct97ly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 > 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 > shows up when building xlib_libXfont2 with optimization but not when
 > building with -O0. To work around this, if
 > BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

 > Fixes:
 > http://autobuild.buildroot.net/results/210/21099d27c03948daaca2d1c149eeba084427e3af/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
