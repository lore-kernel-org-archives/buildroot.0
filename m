From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Wed, 26 Dec 2018 21:41:50 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/clang: bump to version 7.0.1
In-Reply-To: <20181226204150.6623-1-valentinkorenblit@gmail.com>
References: <20181226204150.6623-1-valentinkorenblit@gmail.com>
Message-ID: <20181226204150.6623-3-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index aaca1a74a2..fe868f5874 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 550212711c752697d2f82c648714a7221b1207fd9441543ff4aa9e3be45bba55 cfe-7.0.0.src.tar.xz
+sha256 a45b62dde5d7d5fdcdfa876b0af92f164d434b06e9e89b5d0b1cbc65dfe3f418 cfe-7.0.1.src.tar.xz
 sha256 3f3f2e96e3b7319d2b4b49227d6da624a717340107ce2ca5342a25e0e57dfd35 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index f9d4ae3713..c15f2b0d2a 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 7.0.0
+CLANG_VERSION = 7.0.1
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
-- 
2.11.0
