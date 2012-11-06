From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue,  6 Nov 2012 02:34:39 +0100
Subject: [Buildroot] (resend) [PATCH 1/1] libxml : bump to version 2.9.0
Message-ID: <1352165679-19308-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


bump to version 2.9.0
A few new API entry points, More resilient push parser mode,
A lot of portability improvement, Faster XPath evaluation...
Full list here : http://www.xmlsoft.org/news.html

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libxml2/libxml2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 71f2bd1..8b350dd 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXML2_VERSION = 2.8.0
+LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
-- 
1.8.0
