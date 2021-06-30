From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 30 Jun 2021 10:36:59 -0700
Subject: [Buildroot] [PATCH v2 4/5] package/nginx-dav-ext: bump version to
 3.0.0
In-Reply-To: <20210630173700.30975-1-aduskett@gmail.com>
References: <20210630173700.30975-1-aduskett@gmail.com>
Message-ID: <20210630173700.30975-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx-dav-ext/nginx-dav-ext.hash | 4 ++--
 package/nginx-dav-ext/nginx-dav-ext.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index fbed87f0c0..07deab08db 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-0.1.0.tar.gz
-sha256 40581cf424621965adaf1461e97129520ff4fcfb62ed9965ec6fd50b7f4ddfca  LICENSE
+sha256 d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859  nginx-dav-ext-3.0.0.tar.gz
+sha256 e377bb81e5024682a66438306e8ff9541d843d3831e480aec2f58eb8d83e48de  LICENSE
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 695287ee2c..1b3071851a 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_DAV_EXT_VERSION = 0.1.0
+NGINX_DAV_EXT_VERSION = 3.0.0
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = LICENSE
-- 
2.31.1
