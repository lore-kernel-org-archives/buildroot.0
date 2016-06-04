From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jun 2016 10:14:44 -0300
Subject: [Buildroot] [PATCH] nginx: security bump to version 1.10.1
Message-ID: <1465046084-4776-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4450 - NULL pointer dereference while writing client request
body.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 394f4d2..c4b0f89 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8ed647c3dd65bc4ced03b0e0f6bf9e633eff6b01bac772bcf97077d58bc2be4d	nginx-1.10.0.tar.gz
+sha256	1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801	nginx-1.10.1.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index fecef7b..5eb5488 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.10.0
+NGINX_VERSION = 1.10.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
-- 
2.7.3
