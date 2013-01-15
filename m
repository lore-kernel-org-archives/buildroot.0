From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 13:05:58 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.1.6
Message-ID: <20130115120547.A44A19A18C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32ab8f21e6877e47c246896c6fb962861b42717d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/Config.in |    2 +-
 package/gnutls/gnutls.mk |    4 ++--
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
