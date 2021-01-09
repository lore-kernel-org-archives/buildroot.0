From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jan 2021 16:08:32 +0100
Subject: [Buildroot] [git commit] package/openvpn: set OPENVPN_CPE_ID_VENDOR
Message-ID: <20210109145346.150C67FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fc3dd8895b9aeb8bdefc6802c9091d1800bfb8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
