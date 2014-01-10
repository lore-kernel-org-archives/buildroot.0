From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jan 2014 15:59:57 -0300
Subject: [Buildroot] [PATCH] gettext: bump to version 0.18.3.2
Message-ID: <1389380397-27056-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4874a82..fbdb19c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.18.3.1
+GETTEXT_VERSION = 0.18.3.2
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
-- 
1.8.3.2
