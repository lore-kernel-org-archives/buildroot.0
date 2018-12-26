From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Wed, 26 Dec 2018 21:41:49 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/llvm: bump to version 7.0.1
In-Reply-To: <20181226204150.6623-1-valentinkorenblit@gmail.com>
References: <20181226204150.6623-1-valentinkorenblit@gmail.com>
Message-ID: <20181226204150.6623-2-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 llvmpipe tested on Raspberry Pi 3

 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 200907fc89..531361ae10 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 8bc1f844e6cbde1b652c19c1edebc1864456fd9c78b8c1bea038e51b363fe222 llvm-7.0.0.src.tar.xz
+sha256 a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b llvm-7.0.1.src.tar.xz
 sha256 0303dfeaac87b80d2d1e543aa38d5be77b0eac93c3d04fe7e3c8eaa71a778667 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 1f9bd447f5..f33ec11fbf 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 7.0.0
+LLVM_VERSION = 7.0.1
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
-- 
2.11.0
