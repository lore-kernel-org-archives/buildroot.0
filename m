From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Jun 2021 21:13:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/chrony: add CHRONY_CPE_ID_VENDOR
Message-ID: <20210603191356.351562-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tuxfamily:chrony is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atuxfamily%3Achrony

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index ef459ad38b..b73ddb56b2 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -8,6 +8,7 @@ CHRONY_VERSION = 4.0
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
+CHRONY_CPE_ID_VENDOR = tuxfamily
 CHRONY_DEPENDENCIES = host-pkgconf
 
 CHRONY_CONF_OPTS = \
-- 
2.30.2
