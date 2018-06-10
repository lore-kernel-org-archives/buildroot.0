From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 12:11:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/fdk-aac: bump version to 0.1.6
Message-ID: <20180610101123.7707-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream and license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fdk-aac/fdk-aac.hash | 6 +++++-
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index cd2e868488..db0f0d535c 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,2 +1,6 @@
+# From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
+sha1 574103e24fe45b3b89a92cc6a7a9d260c483b9e0  fdk-aac-0.1.6.tar.gz
+md5 13c04c5f4f13f4c7414c95d7fcdea50f  fdk-aac-0.1.6.tar.gz
 # Locally computed:
-sha256  2164592a67b467e5b20fdcdaf5bd4c50685199067391c6fcad4fa5521c9b4dd7  fdk-aac-0.1.5.tar.gz
+sha256 aab61b42ac6b5953e94924c73c194f08a86172d63d39c5717f526ca016bed3ad  fdk-aac-0.1.6.tar.gz
+sha256 40b9ad8a1c630853bffc51bb5a46adf5c457afcc7c70d66d2ef919b1f14ccb4e  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 0c9662ef32..72ae553c26 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 0.1.5
+FDK_AAC_VERSION = 0.1.6
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
-- 
2.17.1
