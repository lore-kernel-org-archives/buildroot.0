From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 20:13:40 +0100
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.12.2
Message-ID: <20190127193759.F36808E3D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0abeee374a579b66aa612306f931a3f5cfedd7a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pngquant/pngquant.hash | 4 ++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index f525e466c3..f27eda60dd 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,5 +1,5 @@
 # From https://pngquant.org/releases.html
-sha1 f57ce0112e86ac966c55270ccf5971deff241d4f  pngquant-2.12.0-src.tar.gz
+sha1 24efa42105bf3d8d0f4cf699053d2701ea787bd5  pngquant-2.12.2-src.tar.gz
 # Locally computed
-sha256 0e540c64bb58c05f2a05b4eaf1d3d165f0d3278500f15abfeac47f93f8fa8fa8  pngquant-2.12.0-src.tar.gz
+sha256 bb031c48039ee73ea0e60709bb9ab80c55bfa3a5920b798ea37a03f2757b099c  pngquant-2.12.2-src.tar.gz
 sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 26c293bec3..0053b9a46e 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.12.0
+PNGQUANT_VERSION = 2.12.2
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
