From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 17:15:39 +0100
Subject: [Buildroot] [git commit] nginx: bump version to 1.10.3
Message-ID: <20170204162522.1C1B78164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=181a3e6fba661c6b6d5cb95c68913fca8c40ea9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
