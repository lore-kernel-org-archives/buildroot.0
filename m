From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Apr 2012 21:42:14 +0200
Subject: [Buildroot] [git commit] libecore: xcb backend needs pixman
Message-ID: <20120430194238.EA7BB96C2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=906735414784471c8e32775f4d7fec43b103517e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index c76b3ff..d5d2896 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -73,7 +73,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
 LIBECORE_CONF_OPT += --enable-ecore-x-xcb
-LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util
+LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman
 
 # src/util/makekeys is executed at build time to generate
 # ecore_xcb_keysym_table.h, so it should get compiled for the host.
