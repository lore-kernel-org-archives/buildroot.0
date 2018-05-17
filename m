From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 20:53:03 +0200
Subject: [Buildroot] [git commit] package/clang: bump to version 5.0.2
Message-ID: <20180517185220.4F43981215@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31e4328728dd78f4df7499d5e310be597a759907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

5.0.2  is API and ABI compatible with 5.0.0 and 5.0.1 and includes
mitigations for CVE-2017-5715 (Spectre Variant 2) for X86 and MIPS.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index a5bf909814..bf54f9bb53 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 135f6c9b0cd2da1aff2250e065946258eb699777888df39ca5a5b4fe5e23d0ff cfe-5.0.1.src.tar.xz
+sha256 fa9ce9724abdb68f166deea0af1f71ca0dfa9af8f7e1261f2cae63c280282800  cfe-5.0.2.src.tar.xz
 sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 14d6441c9a..ae0140c783 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 5.0.1
+CLANG_VERSION = 5.0.2
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
