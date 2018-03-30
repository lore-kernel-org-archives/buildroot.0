From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 31 Mar 2018 01:02:08 +0530
Subject: [Buildroot] [PATCH] zstd: fix legal info
Message-ID: <1522438328-7638-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zstd is dual licensed under BSD-3-Clause or GPL-2.0 as per README.md
and source files license header.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index d5459f9..c0fa880 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,7 +6,7 @@
 
 ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
-ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
+ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.7.4
