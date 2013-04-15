From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:57:11 +0100
Subject: [Buildroot] [PATCH] libconfig: add license information
Message-ID: <1366012631-767-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libconfig/libconfig.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3e7aa11..b826c06 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -3,8 +3,11 @@
 # libconfig
 #
 #############################################################
+
 LIBCONFIG_VERSION = 1.4.8
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
+LIBCONFIG_LICENSE = LGPLv2.1+
+LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
 LIBCONFIG_CONF_OPT = --disable-examples
 
-- 
1.7.10.4
