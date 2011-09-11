From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libcurl: bump to version 7.21.7
Message-ID: <20110912052628.7638D8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1a7e85170873abb2b837aac7920cc491f942920
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
