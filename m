From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:17:06 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/jbig2dec: bump to
 version 0.19.0
Message-ID: <20200928211203.B5B2A8E1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8b325de6631538131e25df0d4e90b1b29eb9cd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This bump is needed to fix build with ghostscript 9.53.0

Fixes:
 - http://autobuild.buildroot.org/results/fbcc2fa29f3736f78212cb4b3869ffaeefda7a33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f4d3dc9bc15260ba545118e2d90f432b31b4b20b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jbig2dec/jbig2dec.hash | 4 ++--
 package/jbig2dec/jbig2dec.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/jbig2dec/jbig2dec.hash b/package/jbig2dec/jbig2dec.hash
index 86584b19a6..5a34af37f6 100644
--- a/package/jbig2dec/jbig2dec.hash
+++ b/package/jbig2dec/jbig2dec.hash
@@ -1,7 +1,7 @@
-# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952/MD5SUMS
+# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530/MD5SUMS
 # and SHA512SUMS are missing the hashes for this file.
 # Locally computed:
-sha256  9e19775237350e299c422b7b91b0c045e90ffa4ba66abf28c8fb5eb005772f5e  jbig2dec-0.18.tar.gz
+sha256  279476695b38f04939aa59d041be56f6bade3422003a406a85e9792c27118a37  jbig2dec-0.19.tar.gz
 
 # Hash for license files:
 sha256  1bf5258afe453934484fd0cea97508b72301633a6a78b0ae8a9ee44ac78f26d9  LICENSE
diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
index 08ef89bfcb..59fcddfc1c 100644
--- a/package/jbig2dec/jbig2dec.mk
+++ b/package/jbig2dec/jbig2dec.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-JBIG2DEC_VERSION = 0.18
-JBIG2DEC_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952
+JBIG2DEC_VERSION = 0.19
+JBIG2DEC_SITE = \
+	https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530
 JBIG2DEC_LICENSE = AGPL-3.0+
 JBIG2DEC_LICENSE_FILES = LICENSE
 JBIG2DEC_INSTALL_STAGING = YES
