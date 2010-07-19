From: Malte Starostik <m-starostik@versanet.de>
Date: Mon, 19 Jul 2010 08:25:01 +0200
Subject: [Buildroot] [PATCH] Fix default skeleton path
Message-ID: <1279520701-29156-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 744cae4..f6e02bc 100644
--- a/Makefile
+++ b/Makefile
@@ -271,7 +271,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
-TARGET_SKELETON=$(BASE_DIR)/fs/skeleton
+TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
 
-- 
1.7.1
