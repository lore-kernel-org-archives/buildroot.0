From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:24 +0200
Subject: [Buildroot] [PATCH 01/23] qt: remove useless target qt-status
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-2-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile target 'qt-status' prints pointless information,
so remove it.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 01a3635..68b4e44 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -562,11 +562,6 @@ endif
 qt-dirclean:
 	rm -rf $(QT_TARGET_DIR)
 
-qt-status:
-	@echo "QT_QMAKE:               " $(QT_QMAKE)
-	@echo "QT_DEP_LIBS:            " $(QT_DEP_LIBS)
-	@echo "FREETYPE_DIR:		    " $(FREETYPE_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
