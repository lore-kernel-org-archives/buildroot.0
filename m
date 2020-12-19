From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 19 Dec 2020 13:34:28 -0300
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.17
Message-ID: <20201219163428.29727-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 733cf605adc5..1103152eadf0 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  ec148a494cde9095fb590a51efa306de  snort-2.9.16.1.tar.gz
+md5  3fe89f22def4e9ffda01f07f816e666d  snort-2.9.17.tar.gz
 
 # Locally computed:
-sha256  e3ac45a1a3cc2c997d52d19cd92f1adf5641c3a919387adab47a4d13a9dc9f8e  snort-2.9.16.1.tar.gz
+sha256  c3b234c3922a09b0368b847ddb8d1fa371b741f032f42aa9ab53d67b428dc648  snort-2.9.17.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 794bd1f670df..c618b4a6af62 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.16.1
+SNORT_VERSION = 2.9.17
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.17.1
