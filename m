From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 00:03:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
	glamor support needs egl
In-Reply-To: <20170923113018.20562-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 23 Sep 2017 13:30:18 +0200")
References: <20170923113018.20562-1-bernd.kuhls@t-online.de>
Message-ID: <871sm2oimd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Glamor support in xserver_xorg-server depends on gbm:
 > https://cgit.freedesktop.org/xorg/xserver/tree/configure.ac#n2100

 > Gbm is provided by mesa3d only if egl is enabled:
 > https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n167

 > This patch adds libegl as additional prerequisite for enabling glamor
 > support in xserver_xorg-server.

 > Fixes
 > http://autobuild.buildroot.net/results/04d/04d93745d63fcfbea070c0126862b49f1b6f473e/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
