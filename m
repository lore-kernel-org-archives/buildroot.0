From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:23:35 +0100
Subject: [Buildroot] [git commit] package/tiff: bump version to 4.2.0
Message-ID: <20201223120721.27C958874A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bd72efdafd3b69d33f0c5e5770d6956e89c3b9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash | 2 +-
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 36f30c4418..472ec40e55 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634  tiff-4.1.0.tar.gz
+sha256 eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb  tiff-4.2.0.tar.gz
 sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index b26900ac70..7568215f92 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.1.0
+TIFF_VERSION = 4.2.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
