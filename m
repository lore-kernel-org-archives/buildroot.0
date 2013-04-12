From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Apr 2013 09:15:23 -0300
Subject: [Buildroot] [PATCH 4/4] jquery: bump to version 1.9.1
In-Reply-To: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365768923-28232-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery/jquery.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 871f7a0..4df2801 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -1,6 +1,7 @@
-JQUERY_VERSION = 1.8.3
+JQUERY_VERSION = 1.9.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
+JQUERY_LICENSE = MIT
 
 define JQUERY_EXTRACT_CMDS
 	cp $(DL_DIR)/$(JQUERY_SOURCE) $(@D)
-- 
1.8.1.5
