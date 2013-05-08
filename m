From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 May 2013 17:07:47 +0100
Subject: [Buildroot] [PATCH] atk: add license information
Message-ID: <1368029267-30484-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/atk/atk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 2a85edd..f5b2e91 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -3,10 +3,13 @@
 # atk
 #
 #############################################################
+
 ATK_VERSION_MAJOR = 1.33
 ATK_VERSION = $(ATK_VERSION_MAJOR).6
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
+ATK_LICENSE = LGPLv2+
+ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-- 
1.8.1.2
