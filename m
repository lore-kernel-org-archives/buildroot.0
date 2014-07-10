From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 10 Jul 2014 14:45:24 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: fix typo
Message-ID: <1404996324-16570-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/qt5/qt5base/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 70ddcd3..24e5902 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -126,7 +126,7 @@ config BR2_PACKAGE_QT5BASE_DIRECTFB
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBX11
+	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
-- 
2.0.1
