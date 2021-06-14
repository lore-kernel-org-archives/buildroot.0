From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Jun 2021 22:21:09 +0200
Subject: [Buildroot] [git commit] package/zstd: bump to version 1.5.0
Message-ID: <20210614195019.142C07FC09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aad8bbf58842dd62a4911d2c671ad9598e26b459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index a979501e5f..2d7bf37b2a 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.4.9/zstd-1.4.9.tar.gz.sha256
-sha256  29ac74e19ea28659017361976240c4b5c5c24db3b89338731a6feb97c038d293  zstd-1.4.9.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz.sha256
+sha256  5194fbfa781fcf45b98c5e849651aa7b3b0a008c6b72d4a0db760f3002291e94  zstd-1.5.0.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 63ea8b1b35..194974147c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.9
+ZSTD_VERSION = 1.5.0
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
