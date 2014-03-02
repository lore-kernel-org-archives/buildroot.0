From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Mar 2014 09:58:35 -0300
Subject: [Buildroot] [PATCH 2/5] jquery-ui: bump to version 1.10.4
In-Reply-To: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393765118-9353-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-ui/jquery-ui.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 6524c40..5eadf53 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_UI_VERSION = 1.10.3
+JQUERY_UI_VERSION = 1.10.4
 JQUERY_UI_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 JQUERY_UI_LICENSE = MIT
-- 
1.8.3.2
