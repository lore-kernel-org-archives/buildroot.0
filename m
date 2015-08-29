From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:40:39 +0200
Subject: [Buildroot] [git commit branch/next] eigen: use mercurial tag
Message-ID: <20150829094111.4CBCF801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14fc30a8a163ae41a4d8d502a188ef3fad3182a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that our Mercurial download mechanism has been fixed to also
support tags, let's use this possibility in the eigen package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eigen/eigen.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 0153303..dd88fde 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# version 3.2.5
-EIGEN_VERSION = 175a47a35f0c
+EIGEN_VERSION = 3.2.5
 EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
