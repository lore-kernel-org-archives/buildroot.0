From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:17:51 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/apcupsd: add
 APCUPSD_CPE_ID_VENDOR
Message-ID: <20210610194754.1F8537FF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95167f326fa608c916358f89d429683e1c899b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:apcupsd:apcupsd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapcupsd%3Aapcupsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 47ce1876ae7c202e045fda1c978412cd5c7724c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
