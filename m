From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:15:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/hans: bump version to 1.0
Message-ID: <20170604131508.31495-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hans/hans.hash | 6 ++++--
 package/hans/hans.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index c1a28df12..bde6a7ab8 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/hanstunnel/files/source/
-md5	97a93a886bc766212257198fd99d1061	hans-0.4.4.tar.gz
-sha1	8a21a9acc6d52cf7d2a5049523469e2609716ab3	hans-0.4.4.tar.gz
+md5 8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
+sha1 0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
+# Locally computed
+sha256 f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 505858123..e26c2f37f 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HANS_VERSION = 0.4.4
+HANS_VERSION = 1.0
 HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
 HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
-- 
2.11.0
