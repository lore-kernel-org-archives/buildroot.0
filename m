From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:10 -0300
Subject: [Buildroot] [PATCH 12/13] lesstif: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lesstif/lesstif.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 5115107..cd17087 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 LESSTIF_VERSION = 0.95.2
-LESSTIF_SOURCE  = lesstif-$(LESSTIF_VERSION).tar.bz2
-LESSTIF_SITE    = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
+LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
+LESSTIF_SITE = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
 LESSTIF_INSTALL_STAGING = YES
 LESSTIF_DEPENDENCIES = \
 	xlib_libXt \
 	xlib_libXext \
 	freetype
-
+LESSTIF_LICENSE = LGPLv2+
+LESSTIF_LICENSE_FILES = COPYING.LIB
 LESSTIF_CONF_OPT = \
 	--with-gnu-ld \
 	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
-- 
1.8.5.5
