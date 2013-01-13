From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 13:47:40 +0100
Subject: [Buildroot] [PATCH 1/1] Qt : bump version to latest 4.8.4
Message-ID: <1358081260-14635-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Qt : bump verson to latest release of QT 4
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/qt/qt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b09d0ed..b436ad8 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,7 +11,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.3
+QT_VERSION = 4.8.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkgconf
-- 
1.8.0.1
