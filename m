From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 13:01:20 +0200
Subject: [Buildroot] [PATCH/next] package/eigen: bump version to 3.3.3
Message-ID: <20170528110120.24283-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hash, changed _SITE to upstream tarball according to
http://eigen.tuxfamily.org/index.php

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eigen/eigen.hash | 2 ++
 package/eigen/eigen.mk   | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/eigen/eigen.hash

diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
new file mode 100644
index 000000000..6320a6ec3
--- /dev/null
+++ b/package/eigen/eigen.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 a4143fc45e4454b4b98fcea3516b3a79b8cdb3bc7fadf996d088c6a0d805fea1  3.3.3.tar.bz2
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 6ae29118b..79f02e42a 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EIGEN_VERSION = 3.2.5
-EIGEN_SITE = https://bitbucket.org/eigen/eigen
-EIGEN_SITE_METHOD = hg
+EIGEN_VERSION = 3.3.3
+EIGEN_SOURCE = $(EIGEN_VERSION).tar.bz2
+EIGEN_SITE = https://bitbucket.org/eigen/eigen/get
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
-- 
2.11.0
