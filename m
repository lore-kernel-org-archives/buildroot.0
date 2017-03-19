From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Mar 2017 10:59:50 +0100
Subject: [Buildroot] [PATCH 3/5] package/qt5multimedia: indentation cleanup
In-Reply-To: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1489917592-12454-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index fccdd5d..0a95340 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -66,7 +66,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
-       cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
 endef
 endif
 
-- 
1.9.1
