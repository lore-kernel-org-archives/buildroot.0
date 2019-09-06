From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:38 +0200
Subject: [Buildroot] [PATCH 02/11] package/llvm: add the version major
 variable
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/llvm/llvm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index f14b537d94..e885c63f98 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-LLVM_VERSION = 8.0.1
+LLVM_VERSION_MAJOR = 8
+LLVM_VERSION = $(LLVM_VERSION_MAJOR).0.1
 LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
-- 
2.21.0
