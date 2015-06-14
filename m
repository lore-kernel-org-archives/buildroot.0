From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 14 Jun 2015 17:02:02 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xdiver_xf86-input-tslib: update
	download url
Message-ID: <1434294122-4664-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old url fallback to http://www.pengutronix.de/software/ptxdist/ instead
of http://www.pengutronix.de/software/xf86-input-tslib/download/ breaking
the download.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index c9a1995..cd8c10a 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -6,7 +6,7 @@
 
 XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.ptxdist.org/software/xf86-input-tslib/download
+XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.pengutronix.de/software/xf86-input-tslib/download
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
 XDRIVER_XF86_INPUT_TSLIB_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
-- 
2.4.3
