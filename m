From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 22 Dec 2016 07:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcdio: bump version to 0.94
Message-ID: <20161222060709.30086-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcdio/libcdio.hash | 2 +-
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index cc87ffb9c..35c632a90 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975	libcdio-0.93.tar.gz
+sha256 96e2c903f866ae96f9f5b9048fa32db0921464a2286f5b586c0f02699710025a  libcdio-0.94.tar.gz
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 03e600207..4a7c6745c 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 0.93
+LIBCDIO_VERSION = 0.94
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPLv3+
-- 
2.11.0
