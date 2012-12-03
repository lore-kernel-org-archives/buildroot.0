From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:07 -0300
Subject: [Buildroot] [PATCH 09/14] libcurl: bump to version 7.28.1
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8d8fdb4..47f7deb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBCURL_VERSION = 7.27.0
+LIBCURL_VERSION = 7.28.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_LICENSE = ICS
-- 
1.7.8.6
