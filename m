From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:26:13 +0100
Subject: [Buildroot] [git commit] package/mbedtls: add CPE variables
Message-ID: <20210124160644.8D95981672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ab6c60614a382f8f8c4581154fcfa510a36eb14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:arm:mbed_tls is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aarm%3Ambed_tls

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbedtls/mbedtls.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 77373d8b34..9e3e9f626d 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -12,6 +12,8 @@ MBEDTLS_CONF_OPTS = \
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0
 MBEDTLS_LICENSE_FILES = apache-2.0.txt
+MBEDTLS_CPE_ID_VENDOR = arm
+MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
 # This is mandatory for hiawatha
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
