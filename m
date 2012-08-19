From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:23 -0400
Subject: [Buildroot] [PATCH 1/8] alsa-lib: add license info
Message-ID: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/alsa-lib/alsa-lib.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index c3f61ff..8ed1339 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -7,6 +7,8 @@
 ALSA_LIB_VERSION = 1.0.25
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_LICENSE = LGPLv2.1+
+ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
-- 
1.7.9.5
