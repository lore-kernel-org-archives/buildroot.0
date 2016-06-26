From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 26 Jun 2016 22:13:13 +0200
Subject: [Buildroot] [PATCH v1] qt5enginio: fix version for qt5 5.6.1-1
	update
Message-ID: <1466971993-3685-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix qt5enginio version, is 1.6.1 for qt5.6.1-1 (hash
is already updated by previous qt5 bump version patch).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5enginio/qt5enginio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index b858d1c..51cc5b4 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -6,7 +6,7 @@
 
 # Qt5Enginio does not follow Qt versionning
 # see https://bugreports.qt.io/browse/QTBUG-50111
-QT5ENGINIO_VERSION = 1.6.0
+QT5ENGINIO_VERSION = 1.6.1
 QT5ENGINIO_SITE = $(QT5_SITE)
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl qt5base
-- 
2.8.1
