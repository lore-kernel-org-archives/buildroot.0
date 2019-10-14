From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 11:15:12 -0600
Subject: [Buildroot] [PATCH 1/1] package/nginx: bump to version 1.17.4
Message-ID: <20191014171512.76506-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 4df7906eea..194807500a 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b	nginx-1.16.1.tar.gz
+sha256	62854b365e66670ef4f1f8cc79124f914551444da974207cd5fe22d85710e555	nginx-1.17.4.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 08adcaec51..96f9b37bfa 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.16.1
+NGINX_VERSION = 1.17.4
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.20.1
