From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] libxslt: bump to version 1.1.26
Message-ID: <20101222232250.492228E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ff354debfa6391cf5762519652cb6cac27bc96f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libxslt to version 1.1.26

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....21-configure.patch => libxslt-configure.patch} |    0
 package/libxslt/libxslt.mk                         |    5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename package/libxslt/{libxslt-1.1.21-configure.patch => libxslt-configure.patch} (100%)

diff --git a/package/libxslt/libxslt-1.1.21-configure.patch b/package/libxslt/libxslt-configure.patch
similarity index 100%
rename from package/libxslt/libxslt-1.1.21-configure.patch
rename to package/libxslt/libxslt-configure.patch
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 5437e29..5fa2f4c 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -3,11 +3,10 @@
 # libxslt
 #
 #############################################################
-LIBXSLT_VERSION = 1.1.24
-LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.gz
+
+LIBXSLT_VERSION = 1.1.26
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
-LIBXSLT_INSTALL_TARGET = YES
 
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-- 
1.7.2.2
