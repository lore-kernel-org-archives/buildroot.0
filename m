From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:30:49 +0100
Subject: [Buildroot] [git commit] package/clang: bump to version 9.0.1
Message-ID: <20200106222104.8860182A89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc627d04673716cd04355e521c3fb889e756d00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go back to the github url download again.

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index d9aa57c817..067a2c0470 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 7ba81eef7c22ca5da688fdf9d88c20934d2d6b40bfe150ffd338900890aa4610 cfe-9.0.0.src.tar.xz
+sha256 5778512b2e065c204010f88777d44b95250671103e434f9dc7363ab2e3804253 clang-9.0.1.src.tar.xz
 sha256 ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 87bdf52e8d..d740af5322 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-CLANG_VERSION = 9.0.0
-CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
-CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
+CLANG_VERSION = 9.0.1
+CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
