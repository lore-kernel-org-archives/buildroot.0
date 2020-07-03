From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri,  3 Jul 2020 15:17:49 +0200
Subject: [Buildroot] [PATCH] package/refpolicy: bump to 2.20200229
Message-ID: <20200703131749.1999555-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20200229

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 0c77b626cca5..8605d07c08d5 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 67bd1213e9d014ada15512028bb7f35ef6610c2d209cc5117b8577474aa6147f  refpolicy-2.20190609.tar.bz2
+sha256 dec854512ed00cd057408f330c2cea4de7a4405f7a147458f59c994bf578e4b0  refpolicy-2.20200229.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 1a5fefff0681..a5716f5fcebb 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20190609
+REFPOLICY_VERSION = 2.20200229
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190609
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200229
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
-- 
2.26.2
