From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed,  6 Aug 2014 15:39:09 +0200
Subject: [Buildroot] [PATCH v2 2/3] rpi-userland: .mk: Indent rules with tabs
In-Reply-To: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <1407332350-27220-2-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

---

Changes in v2: New patch
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20f68fa..81ed95c 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -14,7 +14,7 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
-    rm -Rf $(TARGET_DIR)/usr/src
+	rm -Rf $(TARGET_DIR)/usr/src
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
 
-- 
1.9.1
