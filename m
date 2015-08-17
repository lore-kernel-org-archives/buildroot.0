From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 17 Aug 2015 14:07:47 +0300
Subject: [Buildroot] [PATCH 1/1] package/eigen: bump from 3.2.0 to 3.2.5
Message-ID: <1439809667-11702-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

The current version of Eigen in Buildroot is 3.2.0 which was
released in 2013. Eigen is an active project with too many
important changes to begin to list in a bump commit message.
See the project's published changelog for details:
http://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.2.5

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/eigen/eigen.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 1ac5707..0153303 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# version 3.2
-EIGEN_VERSION = ffa86ffb5570
+# version 3.2.5
+EIGEN_VERSION = 175a47a35f0c
 EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
-- 
1.7.9.5
