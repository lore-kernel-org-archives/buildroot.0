From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 16:19:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to 2.0.0
Message-ID: <20191006141904.1793-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index f856ddad2d..fdb03d2f77 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 08670017fd0bb36594f14197f60bebea27b895511251c7c64df6cd33fc667d34  libopenh264-1.8.0.tar.gz
+sha256 73c35f80cc487560d11ecabb6d31ad828bd2f59d412f9cd726cc26bfaf4561fd  libopenh264-2.0.0.tar.gz
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index a1796fc131..08531f851f 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 1.8.0
+LIBOPENH264_VERSION = 2.0.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.20.1
