From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:57:55 +0100
Subject: [Buildroot] [git commit] nginx-dav-ext: bump to v0.1.0
Message-ID: <20171206215458.86B6C82876@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c9e70bbe9cae56e5ee0bb969f65e4c96885238d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update the license file location and add a hash for the license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-dav-ext/nginx-dav-ext.hash | 3 ++-
 package/nginx-dav-ext/nginx-dav-ext.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index ea7eb86..a711f8c 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d  nginx-dav-ext-v0.0.3.tar.gz
+sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-v0.1.0.tar.gz
+sha256 40581cf424621965adaf1461e97129520ff4fcfb62ed9965ec6fd50b7f4ddfca  LICENSE
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 1ba6e10..436bc29 100644
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
