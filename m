From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:15:08 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: add CPE variables
Message-ID: <20210405160039.286458D3CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497981ff3445fdefa0abcb465e7c10131465cc07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:meetecho:janus is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ameetecho%3Ajanus

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index bdf8d7a1e0..98a2184d7d 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -8,6 +8,8 @@ JANUS_GATEWAY_VERSION = 0.10.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
+JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
+JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
