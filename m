From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:46 +0100
Subject: [Buildroot] [PATCH v2 08/22] package/x11r7/xapp_xlsclients: bump
 version to 1.1.4
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsclients/xapp_xlsclients.hash | 9 +++++++--
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
index e1cb80b7fa..a465c3cee3 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002314.html
-sha256	5d9666fcc6c3de210fc70d5a841a404955af709a616fde530fe4e8f7723e3d3d	xlsclients-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002866.html
+md5 4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
+sha1 175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
+sha256 773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
+sha512 42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
+# Locally computed
+sha256 716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648 COPYING
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 798dce029c..167748b338 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.1.3
+XAPP_XLSCLIENTS_VERSION = 1.1.4
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_LICENSE = MIT
-- 
2.11.0
