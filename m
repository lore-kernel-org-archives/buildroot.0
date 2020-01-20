From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon, 20 Jan 2020 10:16:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: bump version to 1.17.7
Message-ID: <20200120091604.5989-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://nginx.org/en/CHANGES

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index ec5a91f..8c5b80f 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	63ee35e15a75af028ffa1f995e2b9c120b59ef5f1b61a23b8a4c33c262fc10c3	nginx-1.17.5.tar.gz
+sha256	b62756842807e5693b794e5d0ae289bd8ae5b098e66538b2a91eb80f25c591ff	nginx-1.17.7.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index f895b78..59fddbb 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.17.5
+NGINX_VERSION = 1.17.7
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.7.4
