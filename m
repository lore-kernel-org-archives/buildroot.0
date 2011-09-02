From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:53 -0300
Subject: [Buildroot] [PATCH 05/13] libcurl: bump to version 7.21.7
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ca293fb..5773570 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -3,7 +3,8 @@
 # libcurl
 #
 #############################################################
-LIBCURL_VERSION = 7.21.2
+
+LIBCURL_VERSION = 7.21.7
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download/
 LIBCURL_INSTALL_STAGING = YES
-- 
1.7.3.4
