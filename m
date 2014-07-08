From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 00:08:26 +0200
Subject: [Buildroot] [git commit] lesstif: add license information
Message-ID: <20140708222428.1CEE59D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=280480ff4d414b7feab1cda49de05071a699dc47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lesstif/lesstif.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
