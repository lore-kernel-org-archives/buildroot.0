From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:00:06 +0100
Subject: [Buildroot] [git commit] package/wpan-tools: change tarball
 compression to xz
Message-ID: <20171211185347.5436C8220C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f8570cb76c97b3726fe2e5d378364fb30d35519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpan-tools/wpan-tools.hash | 4 ++--
 package/wpan-tools/wpan-tools.mk   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
index 6a3b6d1..cfad89a 100644
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
index a604dab..d5e43a9 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 WPAN_TOOLS_VERSION = 0.7
+WPAN_TOOLS_SOURCE = wpan-tools-$(WPAN_TOOLS_VERSION).tar.xz
 WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
 WPAN_TOOLS_LICENSE = ISC
