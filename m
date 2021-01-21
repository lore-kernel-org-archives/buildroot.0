From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:02:00 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: add
 AIRCRACK_NG_CPE_ID_VENDOR
Message-ID: <20210121204358.D5CE5812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c4e31219bf16b4f214c9d5c4c2e0c76f9abb9bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:aircrack-ng:aircrack-ng is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaircrack-ng%3Aaircrack-ng

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index baa1fad9e1..ff87766d6f 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -8,6 +8,7 @@ AIRCRACK_NG_VERSION = 1.6
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
+AIRCRACK_NG_CPE_ID_VENDOR = aircrack-ng
 AIRCRACK_NG_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CMOCKA),cmocka) \
 	$(if $(BR2_PACKAGE_LIBNL),libnl) \
