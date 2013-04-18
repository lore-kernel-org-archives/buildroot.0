From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 18 Apr 2013 09:20:14 +0200
Subject: [Buildroot] [PATCH] libconfig: bump to 1.4.9
Message-ID: <1366269614-4326-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libconfig/libconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3e7aa11..2445186 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -3,7 +3,7 @@
 # libconfig
 #
 #############################################################
-LIBCONFIG_VERSION = 1.4.8
+LIBCONFIG_VERSION = 1.4.9
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
 LIBCONFIG_INSTALL_STAGING = YES
 LIBCONFIG_CONF_OPT = --disable-examples
-- 
1.7.7
