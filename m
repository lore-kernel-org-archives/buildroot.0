From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 20:33:37 +0100
Subject: [Buildroot] [git commit] gnutls: remove unrecognized
 --with-libnettle-prefix
Message-ID: <20190116193531.B926F8DE66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=818b9062888090b43ca7b763698a5657d9f29afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure: WARNING: unrecognized options: --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-libnettle-prefix

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
