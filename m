From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 May 2014 09:41:36 -0300
Subject: [Buildroot] [PATCH] jquery: bump to version 1.11.1
Message-ID: <1400589696-27311-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery/jquery.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 8188012..17d3e8b 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.11.0
+JQUERY_VERSION = 1.11.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
-- 
1.8.5.5
