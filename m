From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Dec 2013 07:33:49 -0300
Subject: [Buildroot] [PATCH] bison: bump to version 3.0.2
Message-ID: <1386326029-31480-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index c1de5dd..fdf87f6 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.0.1
+BISON_VERSION = 3.0.2
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
-- 
1.8.3.2
