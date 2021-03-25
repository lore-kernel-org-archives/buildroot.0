From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 25 Mar 2021 13:54:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/network-manager-openvpn: add CPE
 variables
In-Reply-To: <20210325125442.17709-1-heiko.thiery@gmail.com>
References: <20210325125442.17709-1-heiko.thiery@gmail.com>
Message-ID: <20210325125442.17709-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:network_manager_vpnc ia a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Anetwork_manager_vpnc

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/network-manager-openvpn/network-manager-openvpn.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index 1a872dc127..d861ac65ae 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -11,6 +11,8 @@ NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager
 NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
 NETWORK_MANAGER_OPENVPN_LICENSE = GPL-2.0+
 NETWORK_MANAGER_OPENVPN_LICENSE_FILES = COPYING
+NETWORK_MANAGER_OPENVPN_CPE_ID_VENDOR = gnome
+NETWORK_MANAGER_OPENVPN_CPE_ID_PRODUCT = network_manager_vpnc
 
 NETWORK_MANAGER_OPENVPN_CONF_OPTS = \
 	--without-gnome
-- 
2.30.0
