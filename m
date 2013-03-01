From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Mar 2013 16:11:17 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.25
Message-ID: <20130301151432.70F5D9A526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd807973d851625f4d9b575b97035e3e15261b3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index cf84b2d..ab637de 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMICROHTTPD_VERSION = 0.9.24
+LIBMICROHTTPD_VERSION = 0.9.25
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
