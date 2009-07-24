From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:03 +0200
Subject: [Buildroot] [PATCH 02/13] xorg: reindent configuration option
	details
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2c502491f633bd93aca4d7dcdb046c45882e61fb.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 7af62ee..dad0924 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,13 +1,12 @@
 menuconfig BR2_PACKAGE_XORG7
-bool "X.org X Window System, X11R7, release 7.4"
-default y if BR2_PACKAGE_XSERVER_x11r7
-select BR2_PACKAGE_ZLIB
-select BR2_PACKAGE_LIBPNG
-select BR2_PACKAGE_EXPAT
-select BR2_PACKAGE_FONTCONFIG
-help
-	Support for X11R7 libraries, servers, drivers, and/or
-	applications in the target.
+	bool "X.org X Window System, X11R7, release 7.4"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  Support for X11R7 libraries, servers, drivers, and/or
+	  applications in the target.
 
 if BR2_PACKAGE_XORG7
 
-- 
1.6.0.4
