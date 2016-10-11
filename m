From: Matt Kraai <kraai@ftbfs.org>
Date: Mon, 10 Oct 2016 19:46:00 -0700
Subject: [Buildroot] [PATCH] qt53d,
	qt5serialbus: move to technology preview section
Message-ID: <20161011024600.4939-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 84cbb0f..234dfdd 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -31,7 +31,6 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
-source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
@@ -42,7 +41,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
-source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
@@ -51,7 +49,9 @@ source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "technology preview"
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
-- 
2.9.3
