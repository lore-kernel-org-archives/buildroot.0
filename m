From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 23 Jan 2020 15:57:16 +0000
Subject: [Buildroot] [PATCH] package/lld: Bump lld version to 9.0.1.
Message-ID: <20200123155716.1560-1-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was missed when LLVM and Clang were updated.

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/lld/lld.hash | 2 +-
 package/lld/lld.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index 3d5a3feb9a..2144cc5666 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 31c6748b235d09723fb73fea0c816ed5a3fab0f96b66f8fbc546a0fcc8688f91  lld-9.0.0.src.tar.xz
+sha256 86262bad3e2fd784ba8c5e2158d7aa36f12b85f2515e95bc81d65d75bb9b0c82  lld-9.0.1.src.tar.xz
 sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index bba608d64a..ea09c5d340 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 9.0.0
-LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
+LLD_VERSION = 9.0.1
+LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
-- 
2.20.1
