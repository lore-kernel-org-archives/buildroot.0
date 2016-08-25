From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:13:05 +0200
Subject: [Buildroot] [git commit branch/next] micropython-lib: bump version
	to v1.8.2
Message-ID: <20160825131817.AE009822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da22fccffb3ab6bbeb123410790bd390b3ae2a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython-lib/micropython-lib.hash | 2 +-
 package/micropython-lib/micropython-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index 30d0cf8..fc1595a 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e659444fadd755c1b5dbff091aa1b23a835e7361da3a32f38774bd39a15937ad  micropython-lib-v1.0.tar.gz
+sha256 4f9250a93413c9925b912d54fe3aaee2d275c82bdb447fc07a090fc60287f5e8  micropython-lib-v1.8.2.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 4ed2120..a0b533a 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_LIB_VERSION = v1.0
+MICROPYTHON_LIB_VERSION = v1.8.2
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
