From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 13:03:33 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: remove duplicate QUIET
	entries
Message-ID: <20120425115811.ED2A496B3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcafc9575693a77e169202b66f41db2c67ef7363
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
