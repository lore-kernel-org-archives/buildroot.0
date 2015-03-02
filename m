From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:27 -0000
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-cirrus:
	bump version
Message-ID: <20150302222717.8299A807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc302415665c99c970acbef7b3973e3e0085cf9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use git snapshot for compatibility with xorg xserver 1.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-cirrus.mk                   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 0bc8c2f..e68656d 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_CIRRUS_VERSION = 1.5.2
-XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_CIRRUS_VERSION = df389885adf71ed3b045c2fde9fd3ba4329e1a58
+XDRIVER_XF86_VIDEO_CIRRUS_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-cirrus
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
