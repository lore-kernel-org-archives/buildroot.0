From: Matt Kraai <kraai@ftbfs.org>
Date: Tue, 18 Oct 2016 07:51:58 -0700
Subject: [Buildroot] [PATCH] qt5base: improve message if directfb is disabled
Message-ID: <20161018145158.30718-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5base/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 64a7f65..7244fbe 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -180,7 +180,7 @@ config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "directfb support"
 	depends on BR2_PACKAGE_DIRECTFB
 
-comment "directfb backend if directb is enabled"
+comment "directfb backend available if directfb is enabled"
 	depends on !BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT5BASE_XCB
-- 
2.9.3
