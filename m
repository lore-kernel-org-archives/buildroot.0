From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 27 Jul 2018 22:00:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/clang: bump to version 6.0.1
In-Reply-To: <20180727200033.27176-1-romain.naour@gmail.com>
References: <20180727200033.27176-1-romain.naour@gmail.com>
Message-ID: <20180727200033.27176-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://releases.llvm.org/6.0.1/tools/clang/docs/ReleaseNotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 600c3cc9a4..f2bd3db4ed 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 e07d6dd8d9ef196cfc8e8bb131cbd6a2ed0b1caf1715f9d05b0f0eeaddb6df32  cfe-6.0.0.src.tar.xz
+sha256 7c243f1485bddfdfedada3cd402ff4792ea82362ff91fbdac2dae67c6026b667  cfe-6.0.1.src.tar.xz
 sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index f828bac72a..230d0c6b73 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 6.0.0
+CLANG_VERSION = 6.0.1
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
-- 
2.14.4
