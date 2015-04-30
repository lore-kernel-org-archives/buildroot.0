From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2015 15:29:31 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.41
Message-ID: <20150430133027.B43D67FD9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb200a1783eb759f33396b7945e87404bd5215bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index fa01fbc..931eaad 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	403d4d46a8690ad8382bd9f156be3eaf4e80869a75b39f03d48bbcb124c7b7a6	libmicrohttpd-0.9.40.tar.gz
+sha256	9798be637d4a1d76a377e1d805d142e6edcfd3ec99c443926448f647af1a7a7c	libmicrohttpd-0.9.41.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index b661f95..e2ff1cf 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.40
+LIBMICROHTTPD_VERSION = 0.9.41
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
