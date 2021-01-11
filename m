From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:14:08 +0100
Subject: [Buildroot] [git commit] package/ed: add ED_CPE_ID_VENDOR
Message-ID: <20210111205638.60DDE8735A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded5d180fa41e5d3b0c0b460166b75e38ffaa00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:ed is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ed/ed.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index deb900e283..1b299781d0 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -9,6 +9,7 @@ ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
 ED_LICENSE_FILES = COPYING
+ED_CPE_ID_VENDOR = gnu
 
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
