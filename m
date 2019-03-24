From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:04:57 +0100
Subject: [Buildroot] [git commit] package/eigen: bump to 3.3.7
Message-ID: <20190324081038.600C7825A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a1ff4fd320972f32726881944939908ba2e948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumped the version of eigen to 3.3.7, which fixes issues when compiling with GCC7 (notably int-in-bool-context errors, fixed in 3.3.5), in addition to various other issues noted in the eigen change logs: http://eigen.tuxfamily.org/index.php?title=ChangeLog
Legal hashes are unchanged in 3.3.7

Signed-off-by: Reed Nightingale <reed.nightingale@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eigen/eigen.hash | 2 +-
 package/eigen/eigen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
index 4a1bcdf93d..e5c8404022 100644
--- a/package/eigen/eigen.hash
+++ b/package/eigen/eigen.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6 3.3.4.tar.bz2
+sha256 9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce 3.3.7.tar.bz2
 sha256 4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1 COPYING.BSD
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING.GPL
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 27c4e212a9..5c9e028442 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EIGEN_VERSION = 3.3.4
+EIGEN_VERSION = 3.3.7
 EIGEN_SOURCE = $(EIGEN_VERSION).tar.bz2
 EIGEN_SITE = https://bitbucket.org/eigen/eigen/get
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
