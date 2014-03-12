From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Mar 2014 21:42:27 +0100
Subject: [Buildroot] [PATCH] luajit: bump to version 2.0.3
Message-ID: <1394656948-8180-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index cb1d94e..cb08767 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.0.2
+LUAJIT_VERSION = 2.0.3
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
-- 
1.7.9.5
