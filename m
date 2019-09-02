From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:51:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nginx: bump to
 version 1.16.0
Message-ID: <20190902161353.301D68A3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f9b879d06dc57c0bb6abfeb06bbd5e864ce7076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0574e8166e039332be8890957cb16249a7230bad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
