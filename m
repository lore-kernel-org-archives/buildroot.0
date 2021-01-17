From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:27:09 +0100
Subject: [Buildroot] [git commit] package/cvs: add CVS_CPE_ID_VENDOR
Message-ID: <20210117140842.DB68681503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a897c89511ced3f312f1370db5cf5d4046f9ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:cvs is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Acvs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cvs/cvs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 6f83ca6408..3d01f335e2 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -10,6 +10,7 @@ CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
 CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
 CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
+CVS_CPE_ID_VENDOR = gnu
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = \
