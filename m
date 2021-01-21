From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:04:38 +0100
Subject: [Buildroot] [git commit] package/xscreensaver: set
 XSCREENSAVER_CPE_ID_VALID
Message-ID: <20210121205057.12D2B88F04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df2a0dd9651686c3ecb56936c992b9d72780962a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xscreensaver_project:xscreensaver is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axscreensaver_project%3Axscreensaver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xscreensaver/xscreensaver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 7893e49d08..cb1e440ea1 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -10,6 +10,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
+XSCREENSAVER_CPE_ID_VALID = YES
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
