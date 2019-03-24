From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Mar 2019 23:10:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/libftdi1: fix libftdi1-config
In-Reply-To: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
References: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
Message-ID: <20190324221019.10193-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add libftdi1-config to LIBFTDI1_CONFIG_SCRIPTS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libftdi1/libftdi1.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index c45c83a711..014dd8401e 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -11,6 +11,7 @@ LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
 LIBFTDI1_LICENSE = LGPL-2.0 (libftdi1), GPL-2.0 with exception (ftdipp1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
+LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
-- 
2.20.1
