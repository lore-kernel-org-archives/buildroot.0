From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 22:22:11 +0200
Subject: [Buildroot] [PATCH 3/3] package/{llvm, clang,
 lld}: update comment to keep them at the same version.
In-Reply-To: <20191024202211.15619-1-romain.naour@smile.fr>
References: <20191024202211.15619-1-romain.naour@smile.fr>
Message-ID: <20191024202211.15619-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
index 0c880018ac..cd76c724ce 100644
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
-- 
2.21.0
