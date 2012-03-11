From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:00:50 +0100
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.24.0
Message-ID: <20120311220227.BB69B90D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d88a3cc40d070f2fa5ec5e936c9aaf4e3a2e2f55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
