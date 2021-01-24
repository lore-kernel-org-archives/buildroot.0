From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:26:12 +0100
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: add CPE
 variables
Message-ID: <20210124160644.7C58581672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b08cced5126ea821908bf564c4cecbad96f50e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libtorrent:libtorrent is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtorrent%3Alibtorrent

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
