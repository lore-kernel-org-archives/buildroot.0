From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 17:30:16 +0100
Subject: [Buildroot] [git commit] micropython-lib: bump version to v1.8.6
Message-ID: <20170124163140.6F854819B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=014d310d6bb374e45e04c64ff0129c8df268cdbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython-lib/micropython-lib.hash | 2 +-
 package/micropython-lib/micropython-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index fc1595a..bc0c22e 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4f9250a93413c9925b912d54fe3aaee2d275c82bdb447fc07a090fc60287f5e8  micropython-lib-v1.8.2.tar.gz
+sha256 eb696009ff8c33004211e484649b34edb14f3efb2ff618942bc8888716757a55  micropython-lib-v1.8.6.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 478d6d6..8c8b142 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_LIB_VERSION = v1.8.2
+MICROPYTHON_LIB_VERSION = v1.8.6
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
