From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:51:03 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/glib-networking:
 add an upstream URL to Config.in
Message-ID: <20191203134255.AE4598143A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3a155b58560367342d35fae0c3282de9cf110f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82b9f2c7f8385280bba3c16085a2f6516864e1d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
