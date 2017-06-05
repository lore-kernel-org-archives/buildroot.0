From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 17:59:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: fix legal-info
Message-ID: <20170605155956.28592-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8ea/8eaa8c4027bca26d5a21da83f67358a43627f1b2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libhdhomerun/libhdhomerun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 4240ce163..b624400b5 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -8,7 +8,7 @@ LIBHDHOMERUN_VERSION = 20161117
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-LIBHDHOMERUN_LICENSE_FILES = lgpl.txt
+LIBHDHOMERUN_LICENSE_FILES = LICENSE
 LIBHDHOMERUN_INSTALL_STAGING = YES
 
 define LIBHDHOMERUN_BUILD_CMDS
-- 
2.11.0
