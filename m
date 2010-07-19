From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Jul 2010 09:42:56 +0200
Subject: [Buildroot] [git commit master 1/1] Fix default skeleton path
Message-ID: <20100719074322.712778287F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fbc22ecaef7b3422b8e74e50832b210577d8898f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
