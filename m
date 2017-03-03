From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:29 +0100
Subject: [Buildroot] [git commit] libyuv: update homepage link
Message-ID: <20170303074100.1915D822A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6e461db5756440cc5b31d7df6a4db83de0e9c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original google code link redirects to the libyuv bug tracker. Use libyuv
git repo as a better sort of a homepage.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libyuv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libyuv/Config.in b/package/libyuv/Config.in
index 29dcaa4..355ceb0 100644
--- a/package/libyuv/Config.in
+++ b/package/libyuv/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBYUV
 	  libyuv is an open source project that includes YUV scaling
 	  and conversion functionality.
 
-	  https://code.google.com/p/libyuv
+	  https://chromium.googlesource.com/libyuv/libyuv/
 
 comment "libyuv needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
