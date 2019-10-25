From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 18:16:13 +0200
Subject: [Buildroot] [git commit] package/{llvm, clang,
 lld}: update comment to keep them at the same version.
Message-ID: <20191025160946.42567870D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c61153407cd202b08b2e63f2ee8d0cc635cf6180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.mk | 2 +-
 package/lld/lld.mk     | 1 +
 package/llvm/llvm.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 35fe2feef3..87bdf52e8d 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# LLVM and Clang should be version bumped together
+# LLVM, Clang and lld should be version bumped together
 CLANG_VERSION = 9.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index c30e5f0aac..bba608d64a 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM, Clang and lld should be version bumped together
 LLD_VERSION = 9.0.0
 LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index ca89525858..4d9bb1d12f 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# LLVM and Clang should be version bumped together
+# LLVM, Clang and lld should be version bumped together
 LLVM_VERSION = 9.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
