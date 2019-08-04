From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 09:08:06 +0200
Subject: [Buildroot] [git commit] package/diffutils: bump version to 3.7
Message-ID: <20190804070539.5A49F8D4D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efbda08b1b135817c61b9c3a522344224633d56f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-01/msg00000.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/diffutils/diffutils.hash | 4 +++-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 5506ab275a..aa91fd4316 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6  diffutils-3.6.tar.xz
+sha256 b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26  diffutils-3.7.tar.xz
+# Locally calculated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 9a41c985df..586b81ace8 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.6
+DIFFUTILS_VERSION = 3.7
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
