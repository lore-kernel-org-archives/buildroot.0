From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove useless target qt-status
Message-ID: <20091009130112.65EC1772E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=42325834c9ed0ea8b9e328d4eb9a54027f89e38d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile target 'qt-status' prints pointless information,
so remove it.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
