From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Mar 2014 09:58:36 -0300
Subject: [Buildroot] [PATCH 3/5] jquery-ui-themes: bump to version 1.10.4
In-Reply-To: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393765118-9353-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-ui-themes/jquery-ui-themes.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index 2ba6801..269ef69 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_UI_THEMES_VERSION = 1.10.3
+JQUERY_UI_THEMES_VERSION = 1.10.4
 JQUERY_UI_THEMES_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
 JQUERY_UI_THEMES_LICENSE = MIT
-- 
1.8.3.2
