From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:23:57 +0200
Subject: [Buildroot] [git commit] wireshark: fix typo
Message-ID: <20160821202400.C2E4481796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11109fd36a810508c13f7308c19c70223f7870f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index baed846..42a5e74 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -60,7 +60,7 @@ ifeq ($(BR2_PACKAGE_C_ARES),y)
 WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += c-ares
 else
-WIREHARK_CONF_OPTS += --without-c-ares
+WIRESHARK_CONF_OPTS += --without-c-ares
 endif
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
