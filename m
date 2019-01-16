From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jan 2019 19:59:00 +0100
Subject: [Buildroot] [PATCH 1/3] gnutls: remove unrecognized
 --with-libnettle-prefix
Message-ID: <20190116185902.5076-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure: WARNING: unrecognized options: --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-libnettle-prefix

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 7492254e8c..2d670d32d7 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -18,7 +18,6 @@ GNUTLS_CONF_OPTS = \
 	--disable-rpath \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
-	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
-- 
2.14.1
