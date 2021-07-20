From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:56:29 +0200
Subject: [Buildroot] [git commit] package/nginx-modsecurity: bump to version
 1.0.2
Message-ID: <20210720212230.D09F4886E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=e80a7523735edb02d5c2885ecb553bcaa9a59c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 6 +++---
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index d2dd266ac1..fbaf1ca239 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.1/modsecurity-nginx-v1.0.1.tar.gz.sha256
-sha256 def45a8db5bc9da14765eda75363457209a86c89538ccf5bfbd3aa02fa10833c modsecurity-nginx-v1.0.1.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.2/modsecurity-nginx-v1.0.2.tar.gz.sha256
+sha256  41a6660c50508c60df59f8f09c444d18ef8112a4c118cdc791a3992390b78c32  modsecurity-nginx-v1.0.2.tar.gz
 # Localy calculated
-sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index 6d33403d66..90ef8ecd51 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_MODSECURITY_VERSION = 1.0.1
+NGINX_MODSECURITY_VERSION = 1.0.2
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
 NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0
