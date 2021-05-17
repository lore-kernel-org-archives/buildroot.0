From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:24:22 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/udisks: add
 UDISKS_CPE_ID_VENDOR
Message-ID: <20210517210058.72C44875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdd3886dc03402452f90482d691936b5a272b026
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:freedesktop:udisks is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Audisks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6381183d4909a02aa3d5763f3afaa527b3d8db81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
