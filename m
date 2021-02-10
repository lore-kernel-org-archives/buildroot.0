From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:03:37 +0100
Subject: [Buildroot] [git commit] package/shadowsocks-libev: add
 SHADOWSOCKS_LIBEV_CPE_ID_VENDOR
Message-ID: <20210210184301.9B93D83970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41509d63fadcb49f2d6b3a96e67948fd6d014d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:shadowsocks:shadowsocks-libev is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ashadowsocks%3Ashadowsocks-libev

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadowsocks-libev/shadowsocks-libev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 988e708d11..c76983ce5e 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -8,6 +8,7 @@ SHADOWSOCKS_LIBEV_VERSION = 3.3.5
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
+SHADOWSOCKS_LIBEV_CPE_ID_VENDOR = shadowsocks
 SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
 SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
 # We're patching configure.ac
