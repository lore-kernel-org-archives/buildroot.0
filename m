From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:16:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/xserver_xorg-server:
 bump version to 1.20.5
In-Reply-To: <20190602100321.7601-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 2 Jun 2019 12:03:21 +0200")
References: <20190602100321.7601-1-bernd.kuhls@t-online.de>
Message-ID: <87y31qlrpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  .../0001-modesettings-needs-dri2.patch                 |  0
 >  ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 >  .../0003-Remove-check-for-useSIGIO-option.patch        |  0
 >  .../0004-include-misc.h-fix-uClibc-build.patch         |  0
 >  ...hw-xwayland-Makefile.am-fix-build-without-glx.patch |  0
 >  package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
 >  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
