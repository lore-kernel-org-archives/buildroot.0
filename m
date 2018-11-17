From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 21:56:22 -0600
Subject: [Buildroot] [PATCH v2 6/6] llvm/clang: add note about version
 bumping together
In-Reply-To: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542426982-54683-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
---
Changes
v1 -> v2
 - None
---
 package/clang/clang.mk | 1 +
 package/llvm/llvm.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index f9d4ae3..16f93ee 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM and Clang should be version bumped together
 CLANG_VERSION = 7.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 79477f0..56f6ed9 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM and Clang should be version bumped together
 LLVM_VERSION = 7.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
-- 
1.9.1
