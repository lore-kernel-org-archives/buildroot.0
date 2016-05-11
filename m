From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 10 May 2016 21:14:53 -0400
Subject: [Buildroot] [PATCH 1/1] libinput: fix variable name typo
Message-ID: <1462929293-2342-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libinput/libinput.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index d994d29..de6a81c 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += --enable-event-gui
 LIBINPUT_DEPENDENCIES += libgtk3
 else
-LIBINOUT_CONF_OPTS += --disable-event-gui
+LIBINPUT_CONF_OPTS += --disable-event-gui
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
