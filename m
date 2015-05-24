From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2015 15:36:05 +0200
Subject: [Buildroot] [PATCH] package/libgsasl: fix typo in variable name
Message-ID: <1432474565-4880-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libgsasl/libgsasl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index ea634bc..f2660ca 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -9,6 +9,6 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
-LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
+LIBGSASL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
 
 $(eval $(autotools-package))
-- 
1.9.1
