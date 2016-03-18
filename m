From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:30:18 +0100
Subject: [Buildroot] [PATCH 07/14] xdriver_xf86-video-imx-viv: bump to
	version 5.0.11 p7.4
In-Reply-To: <1458140214-22303-8-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:47 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-8-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87vb4jzaf9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog:
 > - License changed to MIT.
 > - Fix GCC5.2 build.

 > Also add a patch pulled from Yocto for the following reason:
 > The 'swaprep.h' is an internal Xorg header and is not being installed
 > anymore. The swap features are provided by the 'misc.h' header now.

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/19935f57
 > https://github.com/Freescale/meta-fsl-arm/commit/277cef92

 > The following xorg.conf was used in order to force the use of the
 > vivante module:
 > https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

 > Note that the X server must be started with the "noreset" option to
 > avoid crashes when closing X apps.
 >  # X -noreset

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
