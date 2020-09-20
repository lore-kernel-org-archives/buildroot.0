From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 16:28:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: bump to version 1.18.0
Message-ID: <20200920142859.1429919-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- https://nginx.org/en/CHANGES-1.18
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/nginx.hash | 4 ++--
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 3ec7ff2444..8d17931a26 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	7dd65d405c753c41b7fdab9415cfb4bdbaf093ec6d9f7432072d52cb7bcbb689	nginx-1.17.9.tar.gz
+sha256  4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99  nginx-1.18.0.tar.gz
 # License files, locally calculated
-sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
+sha256  28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6ecd6a9a80..1f896bc377 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.17.9
+NGINX_VERSION = 1.18.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.28.0
