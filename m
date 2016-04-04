From: Julien Corjon <corjon.j@ecagroup.com>
Date: Mon,  4 Apr 2016 11:56:01 +0200
Subject: [Buildroot] [PATCH 1/2] qt5connectivity: add sdpscanner tool for
	Qt5Bluetooth
Message-ID: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5connectivity/qt5connectivity.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index a68f5ec..936bc6f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -43,6 +43,7 @@ endif
 
 define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
 	$(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
 endef
 
-- 
2.5.0
