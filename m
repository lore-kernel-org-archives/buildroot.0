From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:57:26 +0200
Subject: [Buildroot] [git commit] package/zlog: bump version
Message-ID: <20160605200530.939D881E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90dc956e500017e6e4897d934e098f650f1b4c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlog/zlog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index fb8762c..a60e1b0 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = ca6162be1608839e99c6388c28488c51ccf98e4a
+ZLOG_VERSION = 6ddb9bbf3ff0123e701bf60996f351576ebe9c00
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPLv2.1
 ZLOG_LICENSE_FILES = COPYING
