From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 22 Mar 2017 13:09:48 -0400
Subject: [Buildroot] [PATCH 1/1] nginx-naxsi: bump to 0.55.3
Message-ID: <20170322170948.7416-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 2 +-
 package/nginx-naxsi/nginx-naxsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 967f788..55fc4f1 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	256378564e36b8f222adb8fbe746529e73413c6cbe2b0e5574f41dfd62d92577	nginx-naxsi-0.55.2.tar.gz
+sha256	0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495	nginx-naxsi-0.55.3.tar.gz
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index fb5e00a..33f1b60 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.55.2
+NGINX_NAXSI_VERSION = 0.55.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
-- 
2.9.3
