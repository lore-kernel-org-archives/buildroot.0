From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 16 Aug 2019 20:58:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/clang: bump to 8.0.1
In-Reply-To: <20190816185809.25441-1-valentinkorenblit@gmail.com>
References: <20190816185809.25441-1-valentinkorenblit@gmail.com>
Message-ID: <20190816185809.25441-2-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Project moved to github, updated project URL

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 405e22ce22..209ff0cb30 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 084c115aab0084e63b23eee8c233abb6739c399e29966eaeccfc6e088e0b736b cfe-8.0.0.src.tar.xz
+sha256 70effd69f7a8ab249f66b0a68aba8b08af52aa2ab710dfb8a0fba102685b1646 cfe-8.0.1.src.tar.xz
 sha256 bdc41b826a9a50c7a31c1b613ca5d46415be68d5cc6da06f91f5bc1db8ad87aa LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 07e7fced2a..3796ca8605 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-CLANG_VERSION = 8.0.0
-CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
+CLANG_VERSION = 8.0.1
+CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
 CLANG_LICENSE_FILES = LICENSE.TXT
-- 
2.11.0
