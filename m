From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Dec 2013 19:04:28 -0300
Subject: [Buildroot] [PATCH 2/2] libcurl: security bump to version 7.34.0
In-Reply-To: <1387490668-6554-1-git-send-email-gustavo@zacarias.com.ar>
References: <1387490668-6554-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1387490668-6554-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4545.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index afe39d5..8b8c6c0 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.33.0
+LIBCURL_VERSION = 7.34.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
1.8.3.2
