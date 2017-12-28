From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:06:52 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: drop 2012.11 entries
Message-ID: <20171228090718.3D909837B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bd83aed7c0925955b4730d488b13fd49381e4c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those entries are older than 5 years, we can drop them now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 47b4956..4efce80 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3130,42 +3130,6 @@ config BR2_PACKAGE_DIRECTB_TESTS
 	  The option has been renamed
 	  BR2_PACKAGE_DIRECTFB_TESTS.
 
-###############################################################################
-comment "Legacy options removed in 2012.11"
-
-config BR2_PACKAGE_CUSTOMIZE
-	bool "customize package has been removed"
-	select BR2_LEGACY
-	help
-	  The 'customize' special package has been removed. Instead,
-	  we recommend to create either your own packages, or use a
-	  post-build script to customize your root filesystem. See
-	  Buildroot's documentation for more details.
-
-config BR2_PACKAGE_XSERVER_xorg
-	bool "X.org modular server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR.
-
-config BR2_PACKAGE_XSERVER_tinyx
-	bool "KDrive / TinyX server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
-
-config BR2_PACKAGE_PTHREAD_STUBS
-	bool "pthread-stubs option has been renamed"
-	select BR2_LEGACY
-	select BR2_PACKAGE_LIBPTHREAD_STUBS
-	help
-	  For consistency reason, the pthread-stubs package has been
-	  renamed to libpthread-stubs.
-
 endmenu
 
 endif # !SKIP_LEGACY
