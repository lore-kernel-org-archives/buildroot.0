From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 17 Jul 2014 11:33:56 +0200
Subject: [Buildroot] [PATCH 1/1] jquery-mobile : bump to version 1.4.3
Message-ID: <1405589636-5949-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/jquery-mobile/jquery-mobile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
index 6d17188..3a634ed 100644
--- a/package/jquery-mobile/jquery-mobile.mk
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_MOBILE_VERSION = 1.4.2
+JQUERY_MOBILE_VERSION = 1.4.3
 JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
 JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
 JQUERY_MOBILE_LICENSE = MIT
-- 
2.0.1
