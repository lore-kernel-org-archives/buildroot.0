From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 11:41:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-01-03
In-Reply-To: <8738yhnsus.fsf@dell.be.48ers.dk>
References: <20130104073440.E230952C0FD@lolut.humanoidz.org>
 <8738yhnsus.fsf@dell.be.48ers.dk>
Message-ID: <20130104114111.3c50ee9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 04 Jan 2013 11:30:03 +0100, Peter Korsgaard wrote:

>  Thomas> Build b2107dce84bbc24d9afae3c7b53d972043f6d073
>  Thomas> ==============================================
> 
>  Thomas> Status         : NOK
>  Thomas> Failure reason : libevas-1.7.4
>  Thomas> Architecture   : powerpc
>  Thomas> Submitted by   : Peter Korsgaard (gcc14)
>  Thomas> Submitted at   : 2013-01-03 02:16:08
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/defconfig
> 
> Thomas, it looks like the xcb backend is broken. Care to take a look?

Sure, will do.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : libedje-1.7.4
>  Thomas> Architecture   : i686
>  Thomas> Submitted by   : Peter Korsgaard (gcc110)
>  Thomas> Submitted at   : 2013-01-03 05:30:05
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/cccf7350f3ca04d2141895be19d6d14d4a3f101c/defconfig
> 
> Thomas, it looks like edje depends on specific libevas sub options
> (_SCALE_SMOOTH?) Care to take a look?

Sure, will do.

>  Thomas> Build 5d6d76451a00d79e1bdfe87b6ced61807666cc48
>  Thomas> ==============================================
> 
>  Thomas> Status         : NOK
>  Thomas> Failure reason : gstreamer-0.10.36
>  Thomas> Architecture   : aarch64
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2013-01-03 06:30:38
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/defconfig
> 
> Thomas, seems like we need to preseed as_cv_unaligned_access for
> aarch64, similar to how we do for avr32. Care to take a look?

Ok.

>  Thomas> Build 3266bf1dc6d1542d9419321814c345680626c33e
>  Thomas> ==============================================
> 
>  Thomas> Status         : NOK
>  Thomas> Failure reason : qt-4.8.3
>  Thomas> Architecture   : aarch64
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2013-01-03 08:12:06
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/3266bf1dc6d1542d9419321814c345680626c33e/defconfig
> 
> 64bit / aarch64 issue?

Yes, I already looked at that one, and I know what the fix should be.
Just need to find the time to write it and build this big beast.

>  Thomas> Build d6c9ea1c293d1784e35ddecc0b02d108756c5cfd
>  Thomas> ==============================================
> 
>  Thomas> Status         : NOK
>  Thomas> Failure reason : pango-1.28.4
>  Thomas> Architecture   : i686
>  Thomas> Submitted by   : Peter Korsgaard (gcc110)
>  Thomas> Submitted at   : 2013-01-03 11:27:33
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/defconfig
> 
> Caused by missing deps in enlightenment, fixed.

Thanks! Took me a while to figure out why C++ was needed in Pango.
That's because pango -> cairo -> fontconfig -> freetype. But freetype
itself doesn't require C++, it's the Pango code that gets selected when
Freetype is enabled that contains C++. Maybe a more descriptive comment
on top of the depends on BR2_INSTALL_LIBSTDCPP dependency in
pango/Config.in would be good.

And the Pango configure script is broken: if properly checks for CXX
and disables the Pango test program that needs C++, but it doesn't
error out if Freetype is found, but not the C++ compiler.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
