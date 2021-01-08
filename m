From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jan 2021 18:53:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: set OPENVPN_CPE_ID_VENDOR
Message-ID: <20210108175300.537545-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvpn/openvpn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 53f332534d..913235679a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -10,6 +10,7 @@ OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
+OPENVPN_CPE_ID_VENDOR = $(OPENVPN_NAME)
 OPENVPN_CONF_OPTS = \
 	--disable-unit-tests \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
-- 
2.29.2
