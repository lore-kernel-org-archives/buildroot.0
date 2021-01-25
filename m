From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:26:55 +0100
Subject: [Buildroot] [git commit] package/openswan: add
 OPENSWAN_CPE_ID_VENDOR
Message-ID: <20210125201144.7A35D8375F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326cfb9e4afd39dc03d86e9ddaecf588791a87e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xelerance:openswan is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axelerance%3Aopenswan

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openswan/openswan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 6a96e44a92..7f083f695d 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -8,6 +8,7 @@ OPENSWAN_VERSION = 3.0.0
 OPENSWAN_SITE = $(call github,xelerance,Openswan,v$(OPENSWAN_VERSION))
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
+OPENSWAN_CPE_ID_VENDOR = xelerance
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
