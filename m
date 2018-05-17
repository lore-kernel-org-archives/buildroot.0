From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 17 May 2018 15:31:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: bump to version 5.0.2
Message-ID: <20180517133115.24114-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

5.0.2  is API and ABI compatible with 5.0.0 and 5.0.1 and includes
mitigations for CVE-2017-5715 (Spectre Variant 2) for X86 and MIPS.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 3e998c4328..14f8bb4488 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5fa7489fc0225b11821cab0362f5813a05f2bcf2533e8a4ea9c9c860168807b0	llvm-5.0.1.src.tar.xz
+sha256 d522eda97835a9c75f0b88ddc81437e5edbb87dc2740686cb8647763855c2b3c  llvm-5.0.2.src.tar.xz
 sha256 abd4d8794808bacb1eb6924d49efafd9ab6eef88faaaeb5d3cfa13ee3670d672 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 978f176f28..3abf428989 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 5.0.1
+LLVM_VERSION = 5.0.2
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
-- 
2.14.3
