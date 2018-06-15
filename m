From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 22:23:38 +0200
Subject: [Buildroot] [git commit] clang: bump to version 6.0.0
Message-ID: <20180615204840.7B34A88761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f4616a1de1bf2b73140f4e9426d2225640bbc46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index bf54f9bb53..600c3cc9a4 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 fa9ce9724abdb68f166deea0af1f71ca0dfa9af8f7e1261f2cae63c280282800  cfe-5.0.2.src.tar.xz
+sha256 e07d6dd8d9ef196cfc8e8bb131cbd6a2ed0b1caf1715f9d05b0f0eeaddb6df32  cfe-6.0.0.src.tar.xz
 sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index dc086c6eed..f828bac72a 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 5.0.2
+CLANG_VERSION = 6.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
