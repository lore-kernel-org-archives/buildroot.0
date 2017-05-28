From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 22:40:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: fix download URL
Message-ID: <20170528204057.28697-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libev/libev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 2e3ed4543..87cdd6f61 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEV_VERSION = 4.22
-LIBEV_SITE = http://dist.schmorp.de/libev
+LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
-- 
2.11.0
