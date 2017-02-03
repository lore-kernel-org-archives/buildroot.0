From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:56 -0500
Subject: [Buildroot] [PATCH 08/11] nginx: bump version to 1.10.3
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-8-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 7db2ada..498d272 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1045ac4987a396e2fa5d0011daf8987b612dd2f05181b67507da68cbe7d765c2	nginx-1.10.2.tar.gz
+sha256	75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90	nginx-1.10.3.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index b7384a2..f9b2cd1 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.10.2
+NGINX_VERSION = 1.10.3
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
-- 
2.9.3
