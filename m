From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:09:25 +0200
Subject: [Buildroot] [git commit] package/opencv3: bump version to 3.4.2
Message-ID: <20180731200341.8F74F8AA1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89bf52c8e655081836eab06076b843b0760e0264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after copyright year update:
https://github.com/opencv/opencv/commit/e6ed853905744018d9d570fa49e3b9e33b3c6ea6#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.hash | 5 ++---
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index de15bc8cb7..e2d020db9b 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256 8bb312b9d9fd17336dc1f8b3ac82f021ca50e2034afc866098866176d985adc6  opencv3-3.3.0.tar.gz
-# License files, locally calculated
-sha256 e974db937899a2505f0eb43ece9d2f2eb36e8580ad88785e3ffac0d697ebaf5d  LICENSE
+sha256 81dbd5e7e9f8a4c936b94629bf4765745942a1d634ae38ec08bc57b73b28ffc5  opencv3-3.4.2.tar.gz
+sha256 fea311907cb6271b05ff5843b238e0f2edb6f204a3432975211030d20704b321  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index e8afa7cccf..09455d61b2 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.3.0
+OPENCV3_VERSION = 3.4.2
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
