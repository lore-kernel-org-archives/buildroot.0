From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 22:50:40 +0100
Subject: [Buildroot] [git commit] package/nginx: bump version to 1.17.7
Message-ID: <20200120214202.9B61382DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83077a1163f3d4fcbb187381689d4b0e8539f065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://nginx.org/en/CHANGES

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index ec5a91fc1c..8c5b80f80e 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	63ee35e15a75af028ffa1f995e2b9c120b59ef5f1b61a23b8a4c33c262fc10c3	nginx-1.17.5.tar.gz
+sha256	b62756842807e5693b794e5d0ae289bd8ae5b098e66538b2a91eb80f25c591ff	nginx-1.17.7.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index f895b78779..59fddbb42e 100644
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
