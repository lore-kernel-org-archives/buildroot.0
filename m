From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jan 2013 08:54:46 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.1.6
Message-ID: <1358250886-11786-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/Config.in | 2 +-
 package/gnutls/gnutls.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 2739088..c2ff4ed 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GNUTLS
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
-	  http://www.gnu.org/software/gnutls/gnutls.html
+	  http://www.gnutls.org
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 4c918c1..f65b05d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 3.1.5
+GNUTLS_VERSION = 3.1.6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
-GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
+GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1
 GNUTLS_LICENSE = GPLv3+ LGPLv3
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf nettle $(if $(BR2_PACKAGE_ZLIB),zlib)
-- 
1.7.12.4
