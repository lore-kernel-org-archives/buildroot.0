From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:45:37 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.45
Message-ID: <20151103145129.AEA8D80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a82e00199e92b05c2ff16bc0904b8b46fd57a49c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmicrohttpd/libmicrohttpd.hash |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 0b3b795..618d53a 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f2739cc05112dc00a5ebe1a470174970ca3a3fd71dcd67fb7539af9d83b8411e	libmicrohttpd-0.9.44.tar.gz
+sha256	1075def48da9327be22441f4a3460d24159fae2bf4bcfb4ab6e7ca5e95e54a69	libmicrohttpd-0.9.45.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f649da2..06b40a1 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.44
+LIBMICROHTTPD_VERSION = 0.9.45
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
