From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 14:38:42 +0100
Subject: [Buildroot] [PATCH 1/1] cairo : bump version
Message-ID: <1358084322-16330-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


cairo : bump version
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/cairo/cairo.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6cf910a..bd670d9 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,8 +3,10 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION = 1.10.2
-CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
+CAIRO_VERSION = 1.12.8
+CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
+CAIRO_LICENSE = LGPLv2.1+
+CAIRO_LICENSE_FILES = COPYING
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
-- 
1.8.0.1
