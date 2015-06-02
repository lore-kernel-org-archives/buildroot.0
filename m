From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:45:21 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.42
Message-ID: <20150602205021.94D1C80417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27adf529d7f1fd2e2608e1deaf56a2dd9fe19c8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 931eaad..d5fb7da 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9798be637d4a1d76a377e1d805d142e6edcfd3ec99c443926448f647af1a7a7c	libmicrohttpd-0.9.41.tar.gz
+sha256	00352073367003da40607319e4090a6a8308748b59246ae80e9871f34dad7d5b	libmicrohttpd-0.9.42.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index e2ff1cf..a6662a7 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.41
+LIBMICROHTTPD_VERSION = 0.9.42
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
