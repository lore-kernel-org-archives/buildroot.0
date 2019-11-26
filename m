From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 15:46:24 +0000
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: add an upstream
 URL to Config.in
Message-ID: <20191126154624.600-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/glib-networking/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index e9557309ee..22331255f7 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	help
 	  Network-related GIO modules for glib.
 
+	  https://gitlab.gnome.org/GNOME/glib-networking
+
 comment "glib-networking needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.20.1
