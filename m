From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:40:33 -0800
Subject: [Buildroot] [git commit] libcurl: bump to version 7.28.1
Message-ID: <20121205091358.361028F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0170428f99b5f0fcfa21580a4297cef101b39ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 888f6d0..fd00694 100644
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
