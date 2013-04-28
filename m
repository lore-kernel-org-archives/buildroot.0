From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:51:50 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: adding renamed BR2
	Options
Message-ID: <20130428205744.860E19B8AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76de0f8045371688dab68c0e240b9b8e6d5a45f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Related to the changed directfb variables for
BR2_PACKAGE_DIRECTFB_DITHER_RGB16 and
BR2_PACKAGE_DIRECTFB_TESTS
adding a legacy check.

[Peter: fix DIRECTB_TESTS typo]
Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9de4e14..5165138 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -92,6 +92,22 @@ config BR2_PACKAGE_GDB_HOST
 	  the BR2_PACKAGE_GDB_HOST option has been renamed
 	  BR2_PACKAGE_HOST_GDB.
 
+config BR2_PACKAGE_DIRECTB_DITHER_RGB16
+	bool "DirectFB RGB16 dithering option has been renamed"
+	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
+	select BR2_LEGACY
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_DIRECTFB_DITHER_RGB16.
+
+config BR2_PACKAGE_DIRECTB_TESTS
+	bool "DirectFB Tests option has been renamed"
+	select BR2_PACKAGE_DIRECTFB_TESTS
+	select BR2_LEGACY
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_DIRECTFB_TESTS.
+
 #
 # Legacy options since 2012.11
 #
