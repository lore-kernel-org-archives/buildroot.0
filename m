From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 10:11:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gsl: bump version to 2.5
Message-ID: <20190804081119.2729-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2018-06/msg00007.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gsl/gsl.hash | 3 ++-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index f7b1d53385..8a979d6e8b 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 562500b789cd599b3a4f88547a7a3280538ab2ff4939504c8b4ac4ca25feadfb  gsl-2.3.tar.gz
+sha256 0460ad7c2542caaddc6729762952d345374784100223995eb14d614861f2258d  gsl-2.5.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 41379f4337..d3c764787d 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 2.3
+GSL_VERSION = 2.5
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
-- 
2.20.1
