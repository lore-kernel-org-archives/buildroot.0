From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 07:40:25 -0300
Subject: [Buildroot] [PATCH 2/2] jquery-sparkline: bump to version 2.1.2
In-Reply-To: <1373539225-30092-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373539225-30092-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373539225-30092-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-sparkline/jquery-sparkline.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index af05045..a81ce01 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_SPARKLINE_VERSION = 2.1.1
+JQUERY_SPARKLINE_VERSION = 2.1.2
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
 JQUERY_SPARKLINE_LICENSE = BSD-3c
-- 
1.8.1.5
