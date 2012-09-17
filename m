From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Sep 2012 19:00:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-09-16
In-Reply-To: <20120917063237.C9EAE428029@lolut.humanoidz.org>
References: <20120917063237.C9EAE428029@lolut.humanoidz.org>
Message-ID: <20120917190011.557394ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 17 Sep 2012 08:32:37 +0200 (CEST), Thomas Petazzoni wrote:

> Build 57b12f7d469e16af420c92d33edeba6142ac71a1
> ==============================================
> 
> Status         : NOK
> Failure reason : busybox-1.20.2
> Architecture   : mipsel
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-09-16 14:29:41
> Git commit ID  :
> http://git.buildroot.net/buildroot/commit/?id=f1e79957f857c12bba3d930d6c4b0278ab737132
> End of log     :
> http://autobuild.buildroot.net/results/57b12f7d469e16af420c92d33edeba6142ac71a1/build-end.log
> Complete log   :
> http://autobuild.buildroot.net/results/57b12f7d469e16af420c92d33edeba6142ac71a1/build.log.bz2
> Configuration  :
> http://autobuild.buildroot.net/results/57b12f7d469e16af420c92d33edeba6142ac71a1/config
> Defconfig      :
> http://autobuild.buildroot.net/results/57b12f7d469e16af420c92d33edeba6142ac71a1/defconfig

Fixed this one. It was also a problem in the toolchain default
configuration, since the MIPS64 configuration options clean up has been
merged.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
