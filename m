From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 18:15:43 +0100
Subject: [Buildroot] [git commit] package/sqlcipher: add
 SQLCIPHER_CPE_ID_VENDOR
Message-ID: <20210204170218.B9C5F82DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b10a31c7c583f03e37a4c7cd6e6fe56f7436602d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zetetic:sqlcipher is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azetetic%3Asqlcipher

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 5a9a77c1ee..393d50b201 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -8,6 +8,7 @@ SQLCIPHER_VERSION = 4.4.2
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
+SQLCIPHER_CPE_ID_VENDOR = zetetic
 SQLCIPHER_DEPENDENCIES = host-pkgconf openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
