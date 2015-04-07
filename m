From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 17:07:21 -0300
Subject: [Buildroot] [PATCH] nginx: bump to version 1.6.3
Message-ID: <1428437241-12248-1-git-send-email-gustavo@zacarias.com.ar>
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
index 96e5fb2..5306bed 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18	nginx-1.6.2.tar.gz
+sha256	0a98e95b366e4d6042f331e1fa4d70e18fd1e49d8993e589008e70e742b7e757	nginx-1.6.3.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index dee16af..be9bd0a 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.6.2
+NGINX_VERSION = 1.6.3
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
-- 
2.0.5
