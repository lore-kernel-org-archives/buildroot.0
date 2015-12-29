From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 29 Dec 2015 18:10:33 +0100
Subject: [Buildroot] [PATCH 2/3] xdriver_xf86-video-fbturbo: indentation
	cleanup
In-Reply-To: <1451409034-17537-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1451409034-17537-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1451409034-17537-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
index 991b00e..b2053d3 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -27,7 +27,7 @@ XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += --disable-pciaccess
 endif
 
 define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
-        $(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
+	$(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
 endef
 
 XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
-- 
1.9.1
