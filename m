From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 17 Apr 2014 14:46:01 +0200
Subject: [Buildroot] [PATCH] libnftnl: bump to 1.0.1
Message-ID: <1397738761-8883-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libnftnl/libnftnl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 0aecf12..79e5308 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.0
+LIBNFTNL_VERSION = 1.0.1
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files/
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
-- 
1.8.1.2
