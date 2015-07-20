From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:58 +0200
Subject: [Buildroot] [PATCH 10/11] package/xdriver_xf86-video-cirrus: remove
	autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-10-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdriver_xf86-video-cirrus no longer use the git repository.

commit: e45edc34fadcd6e666a123a4ab32a13b37dc3f74

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index f2523db..78e8a9c 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,7 +9,6 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
-- 
2.4.3
