From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:35:10 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libftdi1: fix
 libftdi1-config
Message-ID: <20190328093303.A2094814C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4a74eae16333820c5c4bb32f237559ff62b359a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add libftdi1-config to LIBFTDI1_CONFIG_SCRIPTS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7eea3ae22453feaa4f40659927c3c9274e478528)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
