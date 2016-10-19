From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 17:38:05 +0200
Subject: [Buildroot] [git commit] nginx: bump to version 1.10.2
Message-ID: <20161019153835.B28A57FD3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6dfbfeb53b6ff63ce97ccd95b3aca409ee4ccf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
