From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:26:37 +0200
Subject: [Buildroot] [git commit branch/next] libcurl: bump to version 7.25.0
Message-ID: <20120518202900.81E8096D2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=357322934d91edb2cb2f3ec20dcaa8208608c226
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e094e31..e8f13bb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBCURL_VERSION = 7.24.0
+LIBCURL_VERSION = 7.25.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_INSTALL_STAGING = YES
