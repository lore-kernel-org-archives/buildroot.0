From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 23:28:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXfont: remove
 autoreconf
In-Reply-To: <20180915121806.5264-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 15 Sep 2018 14:18:05 +0200")
References: <20180915121806.5264-1-bernd.kuhls@t-online.de>
Message-ID: <87in2l1hn5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Nine years ago we added autoreconf to fix libtool-related problems
 > with the matchbox package:

 > https://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc

 > Autoreconf for this package needs the xutil_util-macros but after
 > building this defconfig with autoreconf removed from this package

 > BR2_x86_64=y
 > BR2_x86_core_avx2=y
 > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PACKAGE_XORG7=y
 > BR2_PACKAGE_XLIB_LIBXFONT=y
 > BR2_PACKAGE_MATCHBOX=y
 > BR2_PACKAGE_MATCHBOX_SM=y
 > BR2_PACKAGE_MATCHBOX_COMMON=y
 > BR2_PACKAGE_MATCHBOX_COMMON_PDA=y
 > BR2_PACKAGE_MATCHBOX_DESKTOP=y
 > BR2_PACKAGE_MATCHBOX_KEYBOARD=y
 > BR2_PACKAGE_MATCHBOX_PANEL=y
 > BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR=y

 > it is obvious that the problem which existed nine years ago seems to be
 > gone. So instead of fixing autoreconf we remove it from this package
 > because there is no need for it anymore.

 > Fixes
 > http://autobuild.buildroot.net/results/30c/30cf5cc139f9f6a9dc070953270f74e18b9310d4/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
