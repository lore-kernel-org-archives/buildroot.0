From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Mar 2021 23:40:49 +0100
Subject: [Buildroot] [PATCH v1] package/hwdata: bump version to 0.345
Message-ID: <20210313224049.27458-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 489f47a7cf..be8576d8d2 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f1e79131c870dce4a3b4b75edeefc5c9aef416d488a131c66cb6893be743be63  hwdata-0.342.tar.gz
+sha256  fafcc97421ba766e08a2714ccc3eebb0daabc99e67d53c2d682721dd01ccf7a7  hwdata-0.345.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7d718baca8..0485603f16 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.342
+HWDATA_VERSION = 0.345
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.30.1
