From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 13 Oct 2019 20:30:34 +0200
Subject: [Buildroot] [PATCH] package/fdk-aac: bump to version 2.0.1
Message-ID: <20191013183034.91066-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is a minor update with a number of crash/fuzz fixes only.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/fdk-aac/fdk-aac.hash | 6 +++---
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index a8f380c932..6b41e66a61 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1 30439757fe5bbc8bccedcc8e51668b74db7322c7  fdk-aac-2.0.0.tar.gz
-md5 8ccebea4fc5c9d40fff8f72bf68a6e50  fdk-aac-2.0.0.tar.gz
+sha1 575e90e85321c5be44dcf743a40ea57ab0835928  fdk-aac-2.0.1.tar.gz
+md5 e8b0b38e837df455b8a1ba75417ff0ad  fdk-aac-2.0.1.tar.gz
 # Locally computed:
-sha256 f7d6e60f978ff1db952f7d5c3e96751816f5aef238ecf1d876972697b85fd96c  fdk-aac-2.0.0.tar.gz
+sha256 840133aa9412153894af03b27b03dde1188772442c316a4ce2a24ed70093f271  fdk-aac-2.0.1.tar.gz
 sha256 95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 3904a41b92..92753b5e08 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 2.0.0
+FDK_AAC_VERSION = 2.0.1
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
-- 
2.23.0
