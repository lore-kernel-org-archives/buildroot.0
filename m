From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Mar 2021 20:21:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnet: add LIBNET_CPE_ID_VENDOR
Message-ID: <20210310192139.265084-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libnet_project:libnet is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnet_project%3Alibnet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnet/libnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 966106837a..5c5071b9c3 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -11,5 +11,6 @@ LIBNET_INSTALL_STAGING = YES
 LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = doc/COPYING
+LIBNET_CPE_ID_VENDOR = libnet_project
 
 $(eval $(autotools-package))
-- 
2.30.0
