From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 15:57:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/nmon: bump version to 16g
Message-ID: <20170913135744.9848-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index f3a073ffd6..432f71d846 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5 a72e3eb737c230cd309329330a5545bd    lmon16f.c
-sha1    b69fdddf86ffe674e0133426fa09935ed678ab7d    lmon16f.c
+md5 246ccfc74d5af55d992601fc4d3d4a72  lmon16g.c
+sha1 926217a98f78dd398d4d5690d7b10b8b2b620168  lmon16g.c
 # Locally computed
-sha256  280a371e17488f8a2c5e0c64273155789be6fa5b937ab5c465488e591bdc5cd9    lmon16f.c
+sha256 da82dd693b503b062854dfe7dbb5d36b347872ab44a4aa05b97e9d577747f688  lmon16g.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 2c1ff0220d..f561d6dcc0 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NMON_VERSION = 16f
-NMON_SITE = http://sourceforge.net/projects/nmon/files
+NMON_VERSION = 16g
+NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
 NMON_LICENSE_FILES = $(NMON_SOURCE)
-- 
2.11.0
