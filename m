From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:19:27 +0200
Subject: [Buildroot] [git commit] libatomic_ops: bump to version 7.6.6
Message-ID: <20180909131839.56051838A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d2b57fd7b7608713181b99610fb49499c1bad06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update COPYING hash: sync with FSF's gpl-2.0.txt (see
https://github.com/ivmai/libatomic_ops/commit/aed079e7ce21a033dd7ccb8fa5808d76e4ecb8d5)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libatomic_ops/libatomic_ops.hash | 4 ++--
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 90af18dc38..a913023e21 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 7ee6a1772a49d02711b97c600bd214bd86ba8a31bd7c6d6e850b502780de367c  libatomic_ops-v7.4.10.tar.gz
+sha256 61754aa60bb8052ea64175794df2afae8baacca5420e06eb150230681e71ff5e  libatomic_ops-v7.6.6.tar.gz
 sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index dff62c51b0..100ad70257 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = v7.4.10
+LIBATOMIC_OPS_VERSION = v7.6.6
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
