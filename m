From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:30:07 +0200
Subject: [Buildroot] [git commit] package/tiff: bump to version 4.3.0
Message-ID: <20210713190634.CB79A9554B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29b5fe6895dcf38eea51bc68baf7310950c4d401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://gitlab.com/libtiff/libtiff/-/blob/v4.3.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tiff/tiff.hash | 4 ++--
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 472ec40e55..ea08a1fc92 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb  tiff-4.2.0.tar.gz
-sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
+sha256  0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8  tiff-4.3.0.tar.gz
+sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c3d8045144..f6c6de12c5 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.2.0
+TIFF_VERSION = 4.3.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
