From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  4 Dec 2017 10:22:50 -0500
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: bump to v0.1.0
Message-ID: <20171204152250.24787-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the license file location and add a hash for the license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx-dav-ext/nginx-dav-ext.hash | 3 ++-
 package/nginx-dav-ext/nginx-dav-ext.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index ea7eb8632e..a711f8c6ff 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d  nginx-dav-ext-v0.0.3.tar.gz
+sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-v0.1.0.tar.gz
+sha256 40581cf424621965adaf1461e97129520ff4fcfb62ed9965ec6fd50b7f4ddfca  LICENSE
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 1ba6e10a3f..436bc295ad 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NGINX_DAV_EXT_VERSION = v0.0.3
+NGINX_DAV_EXT_VERSION = v0.1.0
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
-NGINX_DAV_EXT_LICENSE_FILES = ngx_http_dav_ext_module.c
+NGINX_DAV_EXT_LICENSE_FILES = LICENSE
 NGINX_DAV_EXT_DEPENDENCIES = expat
 
 $(eval $(generic-package))
-- 
2.14.3
