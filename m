From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Mar 2013 14:12:02 -0300
Subject: [Buildroot] [PATCH] gettext: bump to version 0.18.2.1
Message-ID: <1362762722-2586-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 204af10..d374050 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GETTEXT_VERSION = 0.18.2
+GETTEXT_VERSION = 0.18.2.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
-- 
1.8.1.5
