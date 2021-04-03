From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:47:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/eigen: use gitlab
 macro
Message-ID: <20210403072612.97666803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a63105a989dac2de46c4121b5d663557734529a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11176ddc1be2f49d118b73ccbbd3889957822c5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eigen/eigen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 1645489717..c9998da357 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 EIGEN_VERSION = 3.3.7
 EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
-EIGEN_SITE = https://gitlab.com/libeigen/eigen/-/archive/$(EIGEN_VERSION)
+EIGEN_SITE = $(call gitlab,libeigen,eigen,$(EIGEN_VERSION))
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
