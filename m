From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 22:31:23 +0100
Subject: [Buildroot] [git commit] package/fdk-aac: bump to version 2.0.0
Message-ID: <20190113214626.E520D8D3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31ff32824a4f3d09351367c3418b5605f9c40521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fdk-aac/fdk-aac.hash | 8 ++++----
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index db0f0d535c..a8f380c932 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1 574103e24fe45b3b89a92cc6a7a9d260c483b9e0  fdk-aac-0.1.6.tar.gz
-md5 13c04c5f4f13f4c7414c95d7fcdea50f  fdk-aac-0.1.6.tar.gz
+sha1 30439757fe5bbc8bccedcc8e51668b74db7322c7  fdk-aac-2.0.0.tar.gz
+md5 8ccebea4fc5c9d40fff8f72bf68a6e50  fdk-aac-2.0.0.tar.gz
 # Locally computed:
-sha256 aab61b42ac6b5953e94924c73c194f08a86172d63d39c5717f526ca016bed3ad  fdk-aac-0.1.6.tar.gz
-sha256 40b9ad8a1c630853bffc51bb5a46adf5c457afcc7c70d66d2ef919b1f14ccb4e  NOTICE
+sha256 f7d6e60f978ff1db952f7d5c3e96751816f5aef238ecf1d876972697b85fd96c  fdk-aac-2.0.0.tar.gz
+sha256 95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 72ae553c26..3904a41b92 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 0.1.6
+FDK_AAC_VERSION = 2.0.0
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
