From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:44:05 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.26
Message-ID: <20130403204842.373369B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cdd1c5f92a7428ac21eb037393e444912b0a920
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ab637de..b1bee53 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMICROHTTPD_VERSION = 0.9.25
+LIBMICROHTTPD_VERSION = 0.9.26
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
