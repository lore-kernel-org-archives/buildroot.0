From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:54:06 +0200
Subject: [Buildroot] [git commit] qt5connectivity: add sdpscanner tool for
	Qt5Bluetooth
Message-ID: <20160413215417.AB5408046B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee7cb3ba995a867e0e5ba03afb03e6054ae375e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
