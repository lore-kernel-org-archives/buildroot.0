From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Feb 2013 09:29:29 +0100
Subject: [Buildroot] [PATCH] luajit: bump to version 2.0.1
Message-ID: <1361348969-21046-1-git-send-email-francois.perrad@gadz.org>
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
index 844122e..bf9cfe8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.0
+LUAJIT_VERSION = 2.0.1
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
-- 
1.7.9.5
