From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jan 2021 23:19:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: add CPE
 variables
Message-ID: <20210123221956.237522-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libtorrent:libtorrent is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtorrent%3Alibtorrent

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index de8c122520..7f60252e9b 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -9,6 +9,8 @@ LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
+LIBTORRENT_RASTERBAR_CPE_ID_VENDOR = libtorrent
+LIBTORRENT_RASTERBAR_CPE_ID_PRODUCT = libtorrent
 LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost openssl
 LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
-- 
2.29.2
