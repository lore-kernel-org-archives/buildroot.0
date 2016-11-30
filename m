From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 30 Nov 2016 17:10:39 +0100
Subject: [Buildroot] [PATCH 1/3] lsqlite3: bump to version 0.9.4
Message-ID: <20161130161041.22566-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.hash | 2 +-
 package/lsqlite3/lsqlite3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 23273bb..e7d3ce0 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b49b5941af92a6e7834a45f76dba1f6ea8f817cda373655f59c9da78416d1dfc  lsqlite3-0.9.3-0.src.rock
+sha256	090282f9b8df614d70d07442ba82de3cc02a2f44cb1059fda648155d4d7e52ef  lsqlite3-0.9.4-2.src.rock
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index db65ae5..6f6445d 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.3-0
-LSQLITE3_SUBDIR = lsqlite3_fsl09w
+LSQLITE3_VERSION = 0.9.4-2
+LSQLITE3_SUBDIR = lsqlite3_fsl09x
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
-- 
2.9.3
