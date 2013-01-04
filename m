From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 11:30:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-01-03
In-Reply-To: <20130104073440.E230952C0FD@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Fri, 4 Jan 2013 08:34:40 +0100 (CET)")
References: <20130104073440.E230952C0FD@lolut.humanoidz.org>
Message-ID: <8738yhnsus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Build fe25485bde8894daff5bdf806eb4bb2fa776dc55
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : tvheadend-v3.3
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2013-01-03 00:13:22
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/defconfig

Yann, it looks like we should patch out the -Werror from the
Makefile. Care to take a look?


 Thomas> Build b2107dce84bbc24d9afae3c7b53d972043f6d073
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : libevas-1.7.4
 Thomas> Architecture   : powerpc
 Thomas> Submitted by   : Peter Korsgaard (gcc14)
 Thomas> Submitted at   : 2013-01-03 02:16:08
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/defconfig

Thomas, it looks like the xcb backend is broken. Care to take a look?


 Thomas> Status         : NOK
 Thomas> Failure reason : libedje-1.7.4
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Peter Korsgaard (gcc110)
 Thomas> Submitted at   : 2013-01-03 05:30:05
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/defconfig

Thomas, it looks like edje depends on specific libevas sub options
(_SCALE_SMOOTH?) Care to take a look?


 Thomas> Build 5d6d76451a00d79e1bdfe87b6ced61807666cc48
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : gstreamer-0.10.36
 Thomas> Architecture   : aarch64
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2013-01-03 06:30:38
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/defconfig

Thomas, seems like we need to preseed as_cv_unaligned_access for
aarch64, similar to how we do for avr32. Care to take a look?


 Thomas> Build 3266bf1dc6d1542d9419321814c345680626c33e
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : qt-4.8.3
 Thomas> Architecture   : aarch64
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2013-01-03 08:12:06
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/defconfig

64bit / aarch64 issue?


 Thomas> Build d6c9ea1c293d1784e35ddecc0b02d108756c5cfd
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : pango-1.28.4
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Peter Korsgaard (gcc110)
 Thomas> Submitted at   : 2013-01-03 11:27:33
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
 Thomas> End of log     : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/defconfig

Caused by missing deps in enlightenment, fixed.


-- 
Bye, Peter Korsgaard
