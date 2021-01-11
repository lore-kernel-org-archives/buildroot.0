From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:40:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: add
 TCPREPLAY_CPE_ID_VENDOR
Message-ID: <20210111224008.1419274-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tcpreplay:tcpreplay is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atcpreplay%3Atcpreplay

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 8b395b4962..1a1da73337 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -9,6 +9,7 @@ TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPRE
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
+TCPREPLAY_CPE_ID_VENDOR = $(TCPREPLAY_NAME)
 TCPREPLAY_CONF_ENV = \
 	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
-- 
2.29.2
