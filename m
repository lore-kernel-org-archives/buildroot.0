From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Feb 2012 17:30:13 -0300
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.24.0
Message-ID: <1330461013-4584-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a420466..e094e31 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-LIBCURL_VERSION = 7.21.7
+LIBCURL_VERSION = 7.24.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
-LIBCURL_SITE = http://curl.haxx.se/download/
+LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
-- 
1.7.3.4
