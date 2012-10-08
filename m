From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Oct 2012 19:01:03 -0300
Subject: [Buildroot] [PATCH 2/4] libcurl: bump to version 7.27.0
In-Reply-To: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349733665-2584-2-git-send-email-gustavo@zacarias.com.ar>
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
index 090bb4c..8d8fdb4 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBCURL_VERSION = 7.25.0
+LIBCURL_VERSION = 7.27.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_LICENSE = ICS
-- 
1.7.8.6
