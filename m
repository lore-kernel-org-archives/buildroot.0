From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 15:57:01 -0300
Subject: [Buildroot] [PATCH 1/3] jquery: bump to version 1.10.1
Message-ID: <1371063424-28818-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4df2801..98b325b 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -1,4 +1,4 @@
-JQUERY_VERSION = 1.9.1
+JQUERY_VERSION = 1.10.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
-- 
1.8.1.5
