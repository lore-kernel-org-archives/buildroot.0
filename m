From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 14:13:12 +0200
Subject: [Buildroot] [git commit] package/nginx-naxsi: bump to version 0.56
Message-ID: <20190506120851.4136A7FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aee6839207242259f74149bf5838ab80a1b2426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 3 ++-
 package/nginx-naxsi/nginx-naxsi.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 55fc4f1460..1f289c56cd 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495	nginx-naxsi-0.55.3.tar.gz
+sha256	0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4	nginx-naxsi-0.56.tar.gz
+sha256	046812ddc8f250f85b5d6e04218c185849c618b309271ef9d8b01e92c6f7a6ac	naxsi_src/naxsi_json.c
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 491d518363..7cfa94a5d4 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.55.3
+NGINX_NAXSI_VERSION = 0.56
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
