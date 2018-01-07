From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:24:24 +0100
Subject: [Buildroot] [git commit] package/libatomic_ops: bump version to
 7.4.10
Message-ID: <20180107203114.6C63783B3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0b3d592ff5b8cc57fb101c6b549b6762b4bb089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/libatomic_ops.hash | 4 +++-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 9e67624..90af18d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 cf7e61f7f929651b65d6186a03446819805c867f4f75c7148c8f26321eb66260  libatomic_ops-v7.4.6.tar.gz
+sha256 7ee6a1772a49d02711b97c600bd214bd86ba8a31bd7c6d6e850b502780de367c  libatomic_ops-v7.4.10.tar.gz
+sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 483f118..dff62c5 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = v7.4.6
+LIBATOMIC_OPS_VERSION = v7.4.10
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
