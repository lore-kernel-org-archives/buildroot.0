From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 16:17:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/libuv: bump version to 1.14.1
Message-ID: <20170913141733.11538-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 169a7be851..ff10f70f4f 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96088804334a70f84d64f45e4db926fc1dfa42d4a9d22b1812cf47bc0d9b6947  libuv-v1.14.0.tar.gz
+sha256 82fbbb0eaab4adcf8ed513d3b777c8e02ed2e77aae265baf6bd2d68cb84bc9e3  libuv-v1.14.1.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 0b62c5800e..563d010799 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.14.0
+LIBUV_VERSION = v1.14.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.11.0
