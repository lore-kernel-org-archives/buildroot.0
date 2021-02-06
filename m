From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:20:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: add CPE variables
Message-ID: <20210206162005.2006429-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mit:kerberos_5 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amit%3Akerberos_5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index b46e7c6c50..e4f3fa4186 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -11,6 +11,8 @@ LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT
 LIBKRB5_LICENSE_FILES = NOTICE
+LIBKRB5_CPE_ID_VENDOR = mit
+LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
-- 
2.29.2
