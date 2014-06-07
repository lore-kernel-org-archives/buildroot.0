From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  7 Jun 2014 15:20:20 -0300
Subject: [Buildroot] [PATCH] spawn-fcgi: bump to version 1.6.4
Message-ID: <1402165220-21782-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/spawn-fcgi/spawn-fcgi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 670daf7..d3f8c99 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPAWN_FCGI_VERSION = 1.6.3
+SPAWN_FCGI_VERSION = 1.6.4
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 SPAWN_FCGI_LICENSE = BSD-3c
-- 
1.8.5.5
