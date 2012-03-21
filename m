From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 21 Mar 2012 12:02:36 +0100
Subject: [Buildroot] [PATCH] libconfig: bump to 1.4.8 and cleanup
Message-ID: <1332327756-12869-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libconfig/libconfig.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 03825e1..8ef927b 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -3,13 +3,12 @@
 # libconfig
 #
 #############################################################
-LIBCONFIG_VERSION:=1.4.6
-LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
-LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
-LIBCONFIG_INSTALL_STAGING:=YES
+LIBCONFIG_VERSION = 1.4.8
+LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
+LIBCONFIG_INSTALL_STAGING = YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBCONFIG_CONF_OPT:=--disable-cxx
+LIBCONFIG_CONF_OPT = --disable-cxx
 endif
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.7
