From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:49:15 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-tdfx:
	Re-wrap _DEPENDENCIES
Message-ID: <20160607214925.C12827F9CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81cb53296495b91a0f4e0e07143575cf12790b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 4d0ba60..156a46d 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -10,6 +10,15 @@ XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSI
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
+	libdrm \
+	xproto_fontsproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_videoproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xproto \
+	xserver_xorg-server
 
 $(eval $(autotools-package))
