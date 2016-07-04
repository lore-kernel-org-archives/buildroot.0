From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 4 Jul 2016 18:16:21 +0530
Subject: [Buildroot] [PATCH 1/6] gnutls: update legal info
Message-ID: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GnuTLS core library is licensed under LGPLv2.1+ while gnutls-openssl
library is licensed under GPLv3+. Annotate the license with components.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 76d2ca2..c063f8f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION_MAJOR = 3.4
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
+GNUTLS_LICENSE = GPLv3+ (gnutls-openssl library), LGPLv2.1+ (core library)
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
-- 
2.6.2
