From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 09:47:40 +0200
Subject: [Buildroot] [git commit] gcc: remove unused
	EXTRA_GCC1_CONFIG_OPTIONS
Message-ID: <20120425075812.217E68A6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=792976053fcd13eb45bd1ee3ede7fe8bddcc2baa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 3f97a47..a4faf4f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -310,7 +310,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_GCC1_CONFIG_OPTIONS) \
 		$(QUIET) \
 	)
 	touch $@
