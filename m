From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Feb 2011 22:51:43 +0100
Subject: [Buildroot] [git commit master 1/1] sawman: bump version
Message-ID: <20110203215213.5D6058F39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=694301dc5acd5b78d7baae69d622b3f07eb4ef4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old version no longer builds after directfb bump.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sawman/sawman.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index c01a26f..d2d15d8 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,12 +3,10 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.10
+SAWMAN_VERSION:=1.4.11
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-SAWMAN_INSTALL_TARGET = YES
-# SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS,package,sawman))
-- 
1.7.3.4
