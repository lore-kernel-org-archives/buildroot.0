From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Apr 2013 09:15:21 -0300
Subject: [Buildroot] [PATCH 2/4] jquery-sparkline: bump to version 2.1.1
In-Reply-To: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365768923-28232-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-sparkline/jquery-sparkline.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 76adad6..aa6395c 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -1,6 +1,7 @@
-JQUERY_SPARKLINE_VERSION = 2.1
+JQUERY_SPARKLINE_VERSION = 2.1.1
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
+JQUERY_SPARKLINE_LICENSE = BSD-3c
 
 define JQUERY_SPARKLINE_EXTRACT_CMDS
 	cp $(DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
-- 
1.8.1.5
