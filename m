From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:48:56 +0100
Subject: [Buildroot] [git commit] package/logrotate: set
 LOGROTATE_CPE_ID_VALID
Message-ID: <20210118203943.19DEB805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c047bd7dab36bb0248ded11de7ae5bfce454641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:logrotate_project:logrotate is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alogrotate_project%3Alogrotate

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/logrotate/logrotate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index fe674ee6a5..747d8c2930 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -8,6 +8,7 @@ LOGROTATE_VERSION = 3.17.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
+LOGROTATE_CPE_ID_VALID = YES
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
