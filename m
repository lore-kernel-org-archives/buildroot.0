From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:25:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/nmon: bump version to 16m
Message-ID: <20200412142559.1395096-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index 432f71d846..fd3f09c63a 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5 246ccfc74d5af55d992601fc4d3d4a72  lmon16g.c
-sha1 926217a98f78dd398d4d5690d7b10b8b2b620168  lmon16g.c
+md5 df67f07ea4006c6204acff586beada81  lmon16m.c
+sha1 68cd02be19036a287fe352823db93223e73a9411  lmon16m.c
 # Locally computed
-sha256 da82dd693b503b062854dfe7dbb5d36b347872ab44a4aa05b97e9d577747f688  lmon16g.c
+sha256 2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1  lmon16m.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index f7edd66a26..8b39748cce 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMON_VERSION = 16g
+NMON_VERSION = 16m
 NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
-- 
2.25.0
