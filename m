From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 29 Apr 2019 22:50:03 -0400
Subject: [Buildroot] [PATCH 1/2] package/nginx: bump to version 1.16.0
Message-ID: <20190430025004.106145-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 114bf292ce..c322a64db2 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	3d5b90aa17de1700709ae4ec6c4d73d87c888b06c510391bf7104b006fdb2abe	nginx-1.15.12.tar.gz
+sha256	4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345	nginx-1.16.0.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index b8e41b8089..eed7602570 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.15.12
+NGINX_VERSION = 1.16.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.20.1
