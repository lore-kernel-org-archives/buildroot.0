From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 15:34:23 +0200
Subject: [Buildroot] [git commit] libassuan: bump to version 2.2.1
Message-ID: <20150604133646.0839081E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e49f992f98fb6817f35f6dc68344f44ffb8f0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash |    2 +-
 package/libassuan/libassuan.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 15a4a82..a019f76 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,2 +1,2 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  56ac91973c2818a91d4f16ed48265a2b5daf45d3  libassuan-2.1.3.tar.bz2
+sha1  c21b86482f6a3624c2b46b91e20f8415f244233a  libassuan-2.2.1.tar.bz2
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index b86f086..3656ea5 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.1.3
+LIBASSUAN_VERSION = 2.2.1
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
