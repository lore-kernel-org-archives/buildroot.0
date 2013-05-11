From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:39:28 +0200
Subject: [Buildroot] [git commit branch/next] fltk: handle fltk-config script
Message-ID: <20130511204538.15D9B9A09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a47372789ee50b5edb7073fe88af1432701af8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fltk/fltk.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 3f192cd..697eb91 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -12,5 +12,6 @@ FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
 FLTK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt
+FLTK_CONFIG_SCRIPTS = fltk-config
 
 $(eval $(autotools-package))
