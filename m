From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:51:07 +0200
Subject: [Buildroot] [PATCH] libyuv: update homepage link
Message-ID: <9c0da5fc267b53d99487b7315aeedfb6405a465f.1488520267.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original google code link redirects to the libyuv bug tracker. Use libyuv
git repo as a better sort of a homepage.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libyuv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libyuv/Config.in b/package/libyuv/Config.in
index 29dcaa44edb3..355ceb0f4711 100644
--- a/package/libyuv/Config.in
+++ b/package/libyuv/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBYUV
 	  libyuv is an open source project that includes YUV scaling
 	  and conversion functionality.
 
-	  https://code.google.com/p/libyuv
+	  https://chromium.googlesource.com/libyuv/libyuv/
 
 comment "libyuv needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
-- 
2.11.0
