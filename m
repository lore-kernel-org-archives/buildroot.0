From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:16:28 +0200
Subject: [Buildroot] [git commit] package/gsl: bump version to 2.5
Message-ID: <20190804091345.8E57C8A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea4d4a0ded0ce77844691b8e9cf849c837e20ad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2018-06/msg00007.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
