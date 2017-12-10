From: Mario Lang <mlang@blind.guru>
Date: Sun, 10 Dec 2017 22:52:16 +0100
Subject: [Buildroot] [PATCH] package/wpan-tools: change tarball compression
 to xz
Message-ID: <20171210215216.23371-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/wpan-tools/wpan-tools.hash | 4 ++--
 package/wpan-tools/wpan-tools.mk   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
index 6a3b6d16e7..cfad89aa00 100644
--- a/package/wpan-tools/wpan-tools.hash
+++ b/package/wpan-tools/wpan-tools.hash
@@ -1,4 +1,4 @@
 # From http://wpan.cakelab.org/releases/md5sum
-md5	06608f69951088844196f79685318aa9	wpan-tools-0.7.tar.gz
+md5	91f0b640ff66910e977fab6525625624	wpan-tools-0.7.tar.xz
 # Calculated based on the hash above
-sha256	8b690ff0e71e08bece5ec541223fda7abd2d5552d97d3d25b4967609b58fef00	wpan-tools-0.7.tar.gz
+sha256	c16de9d7861c2d9b6a4436a0fac730f9f545ee290b92bc770c538ec6a3f22309	wpan-tools-0.7.tar.xz
diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
index a604dab870..d5e43a92c8 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 WPAN_TOOLS_VERSION = 0.7
+WPAN_TOOLS_SOURCE = wpan-tools-$(WPAN_TOOLS_VERSION).tar.xz
 WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
 WPAN_TOOLS_LICENSE = ISC
-- 
2.15.0
