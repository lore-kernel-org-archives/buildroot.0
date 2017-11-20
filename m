From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 09:24:09 -0500
Subject: [Buildroot] [NEXT 1/1] nginx: bump to 1.12.2
Message-ID: <20171120142409.16664-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 6eef1db..9936ca1 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb	nginx-1.12.1.tar.gz
+sha256	305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416	nginx-1.12.2.tar.gz
 # License files, locally calculated
 sha256	75820469c890db641e54078df018e497fde0542211aa704e15320316a2175780	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ceb8022..e5652af 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.12.1
+NGINX_VERSION = 1.12.2
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.13.6
