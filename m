From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 14:33:40 -0300
Subject: [Buildroot] [PATCH] shared-mime-info: bump to version 1.7
Message-ID: <1476120820-11596-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch URLs to avoid 301s.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/shared-mime-info/Config.in             | 2 +-
 package/shared-mime-info/shared-mime-info.hash | 2 +-
 package/shared-mime-info/shared-mime-info.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index 91a5a15..514044b 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 	  database of common types and the update-mime-database
 	  command used to extend it.
 
-	  http://freedesktop.org/wiki/Software/shared-mime-info
+	  https://freedesktop.org/wiki/Software/shared-mime-info/
 
 comment "shared-mime-info needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index 997751d..2007e0e 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b2f8f85b6467933824180d0252bbcaee523f550a8fbc95cc4391bd43c03bc34c	shared-mime-info-1.6.tar.xz
+sha256	eacc781cfebaa2074e43cf9521dc7ab4391ace8a4712902b2841669c83144d2e	shared-mime-info-1.7.tar.xz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index a70bc9a..e917ab5 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 1.6
+SHARED_MIME_INFO_VERSION = 1.7
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
-SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
+SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
-- 
2.7.3
