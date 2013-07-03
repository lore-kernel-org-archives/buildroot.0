From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 08:41:40 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: get rid of stale variable
	reference
Message-ID: <20130703070348.719639A158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39a38a554cb8add070e6fa14b73898a6579d7aad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 0dc8200..b1484eb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -519,8 +519,7 @@ endif
 cross_compiler:=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
 	uclibc $(GCC_BUILD_DIR3)/.installed \
-	$(STAMP_DIR)/gcc_libs_target_installed \
-	$(GCC_TARGETS)
+	$(STAMP_DIR)/gcc_libs_target_installed
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
