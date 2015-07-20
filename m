From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:59 +0200
Subject: [Buildroot] [PATCH 11/11]
	package/x11r7/xdriver_xf86-video-siliconmotion: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdriver_xf86-video-siliconmotion no longer use the git repository.

commit: b343bc690e0004ab916eda09d88be9f4210e867b

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 37e87a5..2aa22ae 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -9,7 +9,6 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF8
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
-- 
2.4.3
