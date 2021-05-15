From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 10:54:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/udisks: add UDISKS_CPE_ID_VENDOR
Message-ID: <20210515085438.2363053-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:freedesktop:udisks is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Audisks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udisks/udisks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index c6119a8b80..af25c2b8e2 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -8,6 +8,7 @@ UDISKS_VERSION = 1.0.5
 UDISKS_SITE = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
+UDISKS_CPE_ID_VENDOR = freedesktop
 # For 0002-Fix-systemd-service-file.patch
 UDISKS_AUTORECONF = YES
 
-- 
2.30.2
