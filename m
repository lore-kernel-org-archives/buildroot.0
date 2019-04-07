From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Apr 2019 13:50:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to
 0.9.63
Message-ID: <20190407115040.7284-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d54d2bbc14..33160d90f2 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cd0e5d3f95a9e55ef7cdf4d0530e997ba00b8411af9149d9287db785d729c471  libmicrohttpd-0.9.60.tar.gz
+sha256 37c36f1be177f0e37ef181a645cd3baac1000bd322a01c2eff70f3cc8c91749c  libmicrohttpd-0.9.63.tar.gz
 sha256 70e12e2a60151b9ed1a4c94a5ffeb99cd086fa94542b5a92fec581506e8d3121  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index fd7c370855..5e138aaea9 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.60
+LIBMICROHTTPD_VERSION = 0.9.63
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.20.1
