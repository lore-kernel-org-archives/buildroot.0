From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  7 Mar 2014 22:58:15 +0100
Subject: [Buildroot] [PATCH 1/1] poppler/Config.in: indentation cleanup
Message-ID: <1394229495-27209-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/poppler/Config.in |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 919de3e..fce296d 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_POPPLER
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
-	   Poppler is a PDF rendering library based on the xpdf-3.0 code base.
+	  Poppler is a PDF rendering library based on the xpdf-3.0 code base.
 
-	   http://poppler.freedesktop.org/
+	  http://poppler.freedesktop.org/
 
 comment "poppler needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.9.5
