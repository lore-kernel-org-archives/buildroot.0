From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:44 -0000
Subject: [Buildroot] [git commit] package/llvm: bump to 8.0.1
Message-ID: <20190903133620.6C68C81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9728190cd8abab5aea99614c14996cefb6587ecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Project moved to github, updated project URL

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 4c5cea17ff..3e74706dfd 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c llvm-8.0.0.src.tar.xz
+sha256 44787a6d02f7140f145e2250d56c9f849334e11f9ae379827510ed72f12b75e7 llvm-8.0.1.src.tar.xz
 sha256 24b67da19b1422a819395738cb83ea34eee3fdce52870b0d1758524ba1615069 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 1106a07877..f14b537d94 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-LLVM_VERSION = 8.0.0
-LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
+LLVM_VERSION = 8.0.1
+LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
 LLVM_LICENSE_FILES = LICENSE.TXT
