From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Oct 2016 12:12:34 -0300
Subject: [Buildroot] [PATCH] nginx: bump to version 1.10.2
Message-ID: <1476889954-24900-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index c4b0f89..7db2ada 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801	nginx-1.10.1.tar.gz
+sha256	1045ac4987a396e2fa5d0011daf8987b612dd2f05181b67507da68cbe7d765c2	nginx-1.10.2.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index d57f3d0..6563627 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.10.1
+NGINX_VERSION = 1.10.2
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
-- 
2.7.3
