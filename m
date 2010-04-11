From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:18 +0200
Subject: [Buildroot] [PATCH 22/25] Get rid of unused variables
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bb5482644685dcd9dea282de0a27069ea42f8a59.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
