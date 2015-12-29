From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:05:02 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-fbturbo: indentation
	cleanup
Message-ID: <20151229180550.D4CD4802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f13e385670897a536bf29e746579b0a9d73265d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
