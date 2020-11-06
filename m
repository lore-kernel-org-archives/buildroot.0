From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Nov 2020 08:04:17 +0100
Subject: [Buildroot] [git commit branch/next] package/libbluray: bump
 version to 1.2.1
Message-ID: <20201106065705.F00FA86B31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b317eb8802ddb9a3079d66cc1cefd3e60f0d9e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reformatted hashes.

Release notes: https://www.videolan.org/news.html#news-2020-10-23
"A minor release of libbluray was pushed today, focused on fixing bugs
 and improving the support for UHD Blurays."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 6 +++---
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index c92d9f9549..430d477484 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.2.0/libbluray-1.2.0.tar.bz2.sha512
-sha512 d10413b6b86ff2d2e7c4b0103546f2142727cc5209ddb7b227aa74e27384f2e0b9abee37bf8ccc5b0cdfcaeebfb0669cf20903a247df278a8ad6dbd27469d324  libbluray-1.2.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.2.1/libbluray-1.2.1.tar.bz2.sha512
+sha512  e9eeee433034266e88c05ae3469c0bd2bf700d7f16e17ad706f48426c143c823e83c16ab79a637f1e85e4eb858aa0577630671f87ba35d179db2a1d8bc8545c4  libbluray-1.2.1.tar.bz2
 # Locally computed
-sha256 b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
+sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 67ea139d58..e2d7fc0c7d 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.2.0
+LIBBLURAY_VERSION = 1.2.1
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
