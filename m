From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Dec 2019 06:33:01 -0300
Subject: [Buildroot] [PATCH v2] package/snort: bump to version 2.9.15
Message-ID: <20191222093301.32717-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

---
Changes v1 -> v2:
- separate patch that fix build error on a Fedora host machine

---
 package/snort/snort.hash | 2 +-
 package/snort/snort.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 69b3210c0210..898840dadc5a 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 2472989da3aace000d1ea5931ece68f8e5cc0c511e272d65182113a2481e822d  snort-2.9.14.1.tar.gz
+sha256 bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba  snort-2.9.15.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index bfb6f9f91b9d..024c94162bff 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.14.1
+SNORT_VERSION = 2.9.15
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.17.1
