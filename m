From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 May 2017 18:59:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
	version to 0.9.55
Message-ID: <20170529165945.23073-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details refer to release notes:
http://lists.gnu.org/archive/html/info-gnu/2017-05/msg00014.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 5c15b9dfd..a1460fd72 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea	libmicrohttpd-0.9.52.tar.gz
+sha256 0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8  libmicrohttpd-0.9.55.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 785e88672..a87c93b3a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.52
+LIBMICROHTTPD_VERSION = 0.9.55
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.11.0
