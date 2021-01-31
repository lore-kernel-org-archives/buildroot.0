From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:28:00 +0100
Subject: [Buildroot] [git commit] package/squid: add SQUID_CPE_ID_VENDOR
Message-ID: <20210131200802.77A93814C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47b372aa302dd745159b72c086c4d83c00724d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:squid-cache:squid is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asquid-cache%3Asquid

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/squid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1ba375e547..473af2ac12 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -9,6 +9,7 @@ SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
+SQUID_CPE_ID_VENDOR = squid-cache
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
