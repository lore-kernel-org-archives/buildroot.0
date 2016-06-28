From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 28 Jun 2016 06:56:23 +0200
Subject: [Buildroot] [PATCH 1/2] qt5webkit: indentation cleanup
Message-ID: <1467089784-18030-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/qt5/qt5webkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 7add5f9..48aaf94 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -23,6 +23,6 @@ config BR2_PACKAGE_QT5WEBKIT
 	  http://qt.io
 
 comment "qt5webkit needs a toolchain w/ dynamic library"
-        depends on BR2_STATIC_LIBS
-        depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-        depends on !BR2_BINFMT_FLAT
+	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT
-- 
1.9.1
