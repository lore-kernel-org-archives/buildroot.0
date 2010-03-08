From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXcomposite to 0.4.1
Message-ID: <20100308133653.5676C776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=42cbd6ff34e9c8d3016b125451b2fe2c9dcb70e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXcomposite/Config.in         |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
index 7d94882..070752f 100644
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ b/package/x11r7/xlib_libXcomposite/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXcomposite 0.3.1
+	  libXcomposite 0.4.1
 	  X.Org Xcomposite library
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index e8b031d..64b98d4 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.0
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.1
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_AUTORECONF = NO
-- 
1.6.3.3
