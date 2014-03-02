From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Mar 2014 09:58:34 -0300
Subject: [Buildroot] [PATCH 1/5] jquery: bump to version 1.11.0
Message-ID: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
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
index d8e87d7..8188012 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.10.2
+JQUERY_VERSION = 1.11.0
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
-- 
1.8.3.2
