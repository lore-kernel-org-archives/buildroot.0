From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu,  1 Feb 2018 10:37:04 +0100
Subject: [Buildroot] [PATCH 1/1] drbd-utils: bump version to 9.2.0
Message-ID: <20180201093704.16452-1-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the download URL.

This patch fixes many autobuild failures because drbd-utils packages
older than 8.9.9 are no longer provided by linbit.com.

Fixes:
http://autobuild.buildroot.net/results/a6d61c7ca8e505509d84869f072d812da79e949a
http://autobuild.buildroot.net/results/53ea7cfc57d912377b566474b15a47ffc077b047
http://autobuild.buildroot.net/results/3a6d7a384e6558156695b6ac46754976f4db7652
http://autobuild.buildroot.net/results/0576b80240ba439f7c2842a58e8bd418199e6100
http://autobuild.buildroot.net/results/3f9db30f18b58a6258acb5dfb9301936e5e05bf6

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 0a38fdd396..bcbed1ee8a 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913  drbd-utils-8.9.6.tar.gz
+sha256 11299b555b703440ef0af2c74b69cf6dfb833e050b87cfdc3b93d0b71d8820a6  drbd-utils-9.2.0.tar.gz
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 7bac28bc89..bb28729b40 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 8.9.6
-DRBD_UTILS_SITE = http://oss.linbit.com/drbd
+DRBD_UTILS_VERSION = 9.2.0
+DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
 DRBD_UTILS_DEPENDENCIES = host-flex
-- 
2.11.0
