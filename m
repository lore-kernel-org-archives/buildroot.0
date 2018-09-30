From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:08:39 +0200
Subject: [Buildroot] [git commit] package/clang: bump to version 7.0.0
Message-ID: <20180930181808.B76CD8A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb7c269dcbef5249e460034a84b82c6233c8b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE.TXT hash changed due to the Copyright date update.

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clang/clang.hash | 4 ++--
 package/clang/clang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index f2bd3db4ed..aaca1a74a2 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 7c243f1485bddfdfedada3cd402ff4792ea82362ff91fbdac2dae67c6026b667  cfe-6.0.1.src.tar.xz
-sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.TXT
+sha256 550212711c752697d2f82c648714a7221b1207fd9441543ff4aa9e3be45bba55 cfe-7.0.0.src.tar.xz
+sha256 3f3f2e96e3b7319d2b4b49227d6da624a717340107ce2ca5342a25e0e57dfd35 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index b0fc3ab800..52e0b98a76 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 6.0.1
+CLANG_VERSION = 7.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
