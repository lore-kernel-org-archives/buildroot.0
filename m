From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:40:56 +0200
Subject: [Buildroot] [git commit] package/apcupsd: add APCUPSD_CPE_ID_VENDOR
Message-ID: <20210605191039.32BCA8378B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47ce1876ae7c202e045fda1c978412cd5c7724c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apcupsd:apcupsd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapcupsd%3Aapcupsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apcupsd/apcupsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 410bce9aec..9e707e1a5a 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -8,6 +8,7 @@ APCUPSD_VERSION = 3.14.14
 APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/$(APCUPSD_VERSION)
 APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
+APCUPSD_CPE_ID_VENDOR = apcupsd
 APCUPSD_CONF_OPTS = --disable-test
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
