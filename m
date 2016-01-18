From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 10:09:46 +0100
Subject: [Buildroot] [git commit] package/micropython-lib: bump to version
	1.0
Message-ID: <20160118091230.E25717FC4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7528a2735c310e720fbd89b6142cb128bd32ade4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython-lib/micropython-lib.hash | 2 +-
 package/micropython-lib/micropython-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index 7ab22d5..30d0cf8 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f66bfe0e7d2d61119a5def989f74278f42bee7d04162913ea60d3f2955d65909  micropython-lib-v0.5.tar.gz
+sha256 e659444fadd755c1b5dbff091aa1b23a835e7361da3a32f38774bd39a15937ad  micropython-lib-v1.0.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index a4a6cf6..4ed2120 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_LIB_VERSION = v0.5
+MICROPYTHON_LIB_VERSION = v1.0
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
