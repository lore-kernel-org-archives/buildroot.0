From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 28 Jun 2021 09:16:08 -0700
Subject: [Buildroot] [PATCH 3/5] package/nginx-naxsi: bump version to 1.3
In-Reply-To: <20210628161610.3197763-1-aduskett@gmail.com>
References: <20210628161610.3197763-1-aduskett@gmail.com>
Message-ID: <20210628161610.3197763-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Change license to GPL-3.0
  - Change license file to LICENSE
  - Update license hash in nginx-naxsi.hash

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 4 ++--
 package/nginx-naxsi/nginx-naxsi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 1f289c56cd..bd3fcd1ae9 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4	nginx-naxsi-0.56.tar.gz
-sha256	046812ddc8f250f85b5d6e04218c185849c618b309271ef9d8b01e92c6f7a6ac	naxsi_src/naxsi_json.c
+sha256  439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628  nginx-naxsi-1.3.tar.gz
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 7cfa94a5d4..3de1f684f9 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.56
+NGINX_NAXSI_VERSION = 1.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
-NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
-NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+NGINX_NAXSI_LICENSE = GPL-3.0 with OpenSSL exception
+NGINX_NAXSI_LICENSE_FILES = LICENSE
 
 $(eval $(generic-package))
-- 
2.31.1
