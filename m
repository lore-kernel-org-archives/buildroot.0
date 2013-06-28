From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 11:16:03 +0200
Subject: [Buildroot] [git commit] qt5/qt5quick1: Drop qmlviewer from install
	since its no longer provided.
Message-ID: <20130628092438.880D39AF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5e695ec48d62be230574049d7b0f47c08a7d594
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5quick1/qt5quick1.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 8d11e67..fc37388 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -38,7 +38,6 @@ define QT5QUICK1_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
-	cp -dpf $(STAGING_DIR)/usr/bin/qmlviewer $(TARGET_DIR)/usr/bin
 	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
 endef
 
