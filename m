From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:15:16 +0200
Subject: [Buildroot] [git commit] eigen: bump to version 3.3.4
Message-ID: <20171007211709.BC0748108A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b65e491b99591b6c55dcaa3c4003f03f4ad0d57e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumped the version to 3.3.4, and added the hashes of the licence files to
eigen.hash.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eigen/eigen.hash | 8 +++++++-
 package/eigen/eigen.mk   | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
index 6320a6e..4a1bcdf 100644
--- a/package/eigen/eigen.hash
+++ b/package/eigen/eigen.hash
@@ -1,2 +1,8 @@
 # Locally computed
-sha256 a4143fc45e4454b4b98fcea3516b3a79b8cdb3bc7fadf996d088c6a0d805fea1  3.3.3.tar.bz2
+sha256 dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6 3.3.4.tar.bz2
+sha256 4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1 COPYING.BSD
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING.GPL
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
+sha256 f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9 COPYING.MINPACK
+sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85 COPYING.MPL2
+sha256 c83230b770f17ef1386ea1fd3681271dd98aa93646bdbfb5bff3a1b7050fff9d COPYING.README
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 79f02e4..89f54fb 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EIGEN_VERSION = 3.3.3
+EIGEN_VERSION = 3.3.4
 EIGEN_SOURCE = $(EIGEN_VERSION).tar.bz2
 EIGEN_SITE = https://bitbucket.org/eigen/eigen/get
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
