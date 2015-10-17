From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 11:42:51 +0200
Subject: [Buildroot] [git commit] package/fdk-aac: bump to version 0.1.4
Message-ID: <20151017094901.54E6F81D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5fd63b2756241a360dd9bf2b2917acf86e46f7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fdk-aac/fdk-aac.hash |    2 +-
 package/fdk-aac/fdk-aac.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index 8f83951..28a1eee 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a9cb872802cfb7a2aff7a549c114c547d1e518dd60c2f85942229cc20c0d0c8d  fdk-aac-0.1.3.tar.gz
+sha256  5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab  fdk-aac-0.1.4.tar.gz
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 0a97291..a872c54 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 0.1.3
+FDK_AAC_VERSION = 0.1.4
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
