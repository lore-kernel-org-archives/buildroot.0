From: Mehmet Sami Tok <mehmetsamitok@gmail.com>
Date: Fri,  4 Oct 2019 09:33:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to 3.2.0
Message-ID: <20191004063338.9635-1-mehmetsamitok@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mehmet Sami Tok <mehmetsamitok@gmail.com>
---
 package/libwebsockets/libwebsockets.hash | 4 ++--
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 8e33b07316..5bd728bc04 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-2.4.2.tar.gz
-sha256  078fbbbeab357fc6d4f8090e95e9022fa4cb9eac1efd77b2f1387e9ccc51917a    LICENSE
+sha256	5e731c536a20d9c03ae611631db073f05cd77bf0906a8c30d2a13638d4c8c667  libwebsockets-3.2.0.tar.gz
+sha256  4d092cd5e062c5ab0cf6408963d74619b5baf1571344410be6aa5bcef512eb70  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index efdde6de7e..0b488d1f05 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 2.4.2
+LIBWEBSOCKETS_VERSION = 3.2.0
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.17.1
