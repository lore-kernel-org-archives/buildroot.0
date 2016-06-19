From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:36:32 +0200
Subject: [Buildroot] [PATCH 1/7] package/libdvdread: bump version to
	5.0.3
In-Reply-To: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 19 Jun 2016 18:20:23 +0200")
References: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <878ty03lpb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed 0001-fix-os2-support.patch, applied upstream:
 > https://code.videolan.org/videolan/libdvdread/commit/75f8601ee3b19d8914528860f7e1d2906df4a411

 > Removed autoreconf, a configure script is now part of the upstream
 > tarball.

 > The script dvdread-config was removed:
 > https://code.videolan.org/videolan/libdvdread/commit/9991d1720b824902628573abce89916700933c38

 > Changed LIBDVDREAD_SITE according to the news post dating 13 Feb 2014
 > from http://dvdnav.mplayerhq.hu/

 > Enabled static build, tested using this defconfig:
 > http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config

Committed all 7 after moving the mplayer one to the front, thanks.

-- 
Bye, Peter Korsgaard
