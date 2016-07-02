From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:22 +0200
Subject: [Buildroot] [PATCH 53/69] xlib_libxkbfile: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-54-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 51c58c04a0da..c69d73118fe4 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -11,6 +11,7 @@ XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
+HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
