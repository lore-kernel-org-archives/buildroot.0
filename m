From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Aug 2016 10:31:30 +0300
Subject: [Buildroot] [PATCH] wireshark: fix typo
Message-ID: <dc85745fa80cdd4a45de3faee34d9fb15c1f1403.1471764690.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 35f013874ec9..12060e2edd2e 100644
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
-- 
2.8.1
