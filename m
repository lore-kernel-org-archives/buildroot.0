From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 10:31:20 -0300
Subject: [Buildroot] [PATCH 1/6] libfm-extra: bump to version 1.2.4
Message-ID: <1469280685-11787-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfm-extra/Config.in        | 2 +-
 package/libfm-extra/libfm-extra.hash | 5 +++--
 package/libfm-extra/libfm-extra.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
index f0e0b63..79465f9 100644
--- a/package/libfm-extra/Config.in
+++ b/package/libfm-extra/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBFM_EXTRA
 	depends on BR2_USE_MMU # libglib2
 	help
 	  The libfm-extra package contains a library and other files
-	  required by menu-cache-gen libexec of menu-cache-1.0.0
+	  required by menu-cache-gen libexec of menu-cache
 
 	  http://wiki.lxde.org/en/Libfm
 
diff --git a/package/libfm-extra/libfm-extra.hash b/package/libfm-extra/libfm-extra.hash
index 5311dec..8a78ade 100644
--- a/package/libfm-extra/libfm-extra.hash
+++ b/package/libfm-extra/libfm-extra.hash
@@ -1,2 +1,3 @@
-# From http://blog.lxde.org/?p=1280
-sha1  c3f2f34086761d89d6aba549883610084ba00750  libfm-1.2.3.tar.xz
+# From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
+md5	74997d75e7e87dc73398746fd373bf52	libfm-1.2.4.tar.xz
+sha1	2f8183389c8e74edb15c6c8ab260df5dd39f3b2d	libfm-1.2.4.tar.xz
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index f5b1928..0e7a7dc 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_EXTRA_VERSION = 1.2.3
+LIBFM_EXTRA_VERSION = 1.2.4
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-- 
2.7.3
