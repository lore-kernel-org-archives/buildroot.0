From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 23:08:25 +0100
Subject: [Buildroot] [git commit] libconfig: bump to 1.4.8 and cleanup
Message-ID: <20120321223126.186BC96928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b84ec26c8981c6ab0e119b455e807152ded449a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
