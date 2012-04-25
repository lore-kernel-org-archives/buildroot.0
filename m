From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 06:47:38 -0300
Subject: [Buildroot] [PATCH] toolchain/gcc: remove duplicate QUIET entries
Message-ID: <1335347258-2362-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index a4faf4f..a2975dc 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -310,7 +310,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(QUIET) \
 	)
 	touch $@
 
@@ -376,7 +375,6 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(QUIET) \
 	)
 	touch $@
 
-- 
1.7.3.4
