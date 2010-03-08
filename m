From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libxkbfile to 1.0.6
Message-ID: <20100308133658.87A82776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4141c1bce71853b86102247a71dec21c9ddc7a84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libxkbfile/Config.in          |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
index a80a8ca..f120542 100644
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ b/package/x11r7/xlib_libxkbfile/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	help
-	  libxkbfile 1.0.4
+	  libxkbfile 1.0.6
 	  X.Org xkbfile library
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 4c9cb69..7b6de7e 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.0.5
+XLIB_LIBXKBFILE_VERSION = 1.0.6
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_AUTORECONF = NO
-- 
1.6.3.3
