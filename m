From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 20:07:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] zstd: fix legal info
Message-ID: <20180407175150.20D058183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97aefd6657e0a8db044d6172a69a77020bff80ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

zstd is dual licensed under BSD-3-Clause or GPL-2.0 as per README.md
and source files license header.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b2f6548f8d2cad52fd3a5f81febf4818ee66304)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index d5459f99dd..c0fa88026c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,7 +6,7 @@
 
 ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
-ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
+ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
