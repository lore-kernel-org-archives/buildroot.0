From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:06:33 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/network-manager:
 add CPE variables
Message-ID: <20210331055758.327E78777D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9a3b2a09ae61004114cd4d91c4775f0acec1bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnome:networkmanager is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Anetworkmanager

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47f29fe098071d444a804403c1a433358ff7e451)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 4b2ade5b9b..9402564cb4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -13,6 +13,8 @@ NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
+NETWORK_MANAGER_CPE_ID_VENDOR = gnome
+NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
 NETWORK_MANAGER_CONF_ENV = \
