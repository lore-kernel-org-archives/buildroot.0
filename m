From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:48:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/nginx: bump version to 1.17.5
Message-ID: <20191104074838.5511-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://nginx.org/en/CHANGES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 194807500a..ec5a91fc1c 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	62854b365e66670ef4f1f8cc79124f914551444da974207cd5fe22d85710e555	nginx-1.17.4.tar.gz
+sha256	63ee35e15a75af028ffa1f995e2b9c120b59ef5f1b61a23b8a4c33c262fc10c3	nginx-1.17.5.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 96f9b37bfa..7ab656fd8b 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.17.4
+NGINX_VERSION = 1.17.5
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.20.1
