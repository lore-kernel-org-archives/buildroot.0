From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 00:10:45 +0100
Subject: [Buildroot] [git commit] poppler/Config.in: indentation cleanup
Message-ID: <20140307231050.B27AA9BDFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c92fe29fefcfa97b40b3187a2cb1b63b6548a16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
