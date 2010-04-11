From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Get rid of unused variables
Message-ID: <20100411195038.4170A20B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=72f913bb3b395de14d0dfa1bc8096d943ffd9750
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 7fdf697..54dd4f1 100644
--- a/Makefile
+++ b/Makefile
@@ -268,13 +268,6 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 
-# define values for prepatched source trees for toolchains
-VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
-VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
-VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
-VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
-VENDOR_PATCH_DIR:=$(call qstrip,$(BR2_VENDOR_PATCH_DIR))
-
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
 
 include toolchain/Makefile.in
-- 
1.6.3.3
