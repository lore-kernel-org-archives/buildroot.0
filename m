From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:25:42 +0100
Subject: [Buildroot] [git commit] package/atop: set ATOP_CPE_ID_VALID
Message-ID: <20210118210721.F403188518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ddc1b5c934a407c2836fcebfd26b5ed74fcdcb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:atop_project:atop is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aatop_project%3Aatop

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atop/atop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 46baff8f72..587a5b3604 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -8,6 +8,7 @@ ATOP_VERSION = 2.5.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
+ATOP_CPE_ID_VALID = YES
 ATOP_DEPENDENCIES = ncurses zlib
 
 ATOP_CFLAGS = $(TARGET_CFLAGS)
