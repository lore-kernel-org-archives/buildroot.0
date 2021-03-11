From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Mar 2021 08:29:24 -0600
Subject: [Buildroot] [PATCH v11 1/9] package/llvm: bump to version 11.1.0
Message-ID: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 6bf2755777..e93a922492 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
+sha256 ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5 llvm-11.1.0.src.tar.xz
 sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 7d60fe7f8c..6c7ae3f838 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 9.0.1
+LLVM_VERSION = 11.1.0
 LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
-- 
2.17.1
