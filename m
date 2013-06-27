From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 13:40:27 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: fix license file setting
Message-ID: <20130627115740.451219B22B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30c315d6423470eb2ce2ce968facb21410a22bdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable is called <pkg>_LICENSE_FILES, not just _FILE.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a383667..e29e956 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -6,7 +6,7 @@
 
 LIBMICROHTTPD_VERSION = 0.9.27
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
-LIBMICROHTTPD_LICENSE_FILE = COPYING
+LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
