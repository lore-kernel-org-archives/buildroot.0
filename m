From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:44:25 +0200
Subject: [Buildroot] [git commit] directfb: expanding the help strings
Message-ID: <20130428205744.1724C9B895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d1a1431d0d4d860b57ae05ee01da1be17eac0e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a helper string for the PXA3xx and graphics driver from Marvell
and the EP9x graphics driver from Cirrus Logic.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index a184568..796be37 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -49,10 +49,21 @@ config BR2_PACKAGE_DIRECTFB_MATROX
 config BR2_PACKAGE_DIRECTFB_PXA3XX
 	bool "compile pxa3xx graphics driver"
 	depends on BR2_arm
+	help
+	  The Marvell PXA3xx Processor Family is a system-on-chip based
+	  on XScale?? microarchitecture. This option enables the graphic
+	  driver support for the PXA3xx processor family.
+
+	  http://www.marvell.com/application-processors/pxa-family/
 
 config BR2_PACKAGE_DIRECTFB_EP9X
 	bool "compile ep9x graphics driver"
 	depends on BR2_arm
+	help
+	  Enable the graphic driver support for the EP93xx ARMv9 based
+	  processors from Cirrus Logic.
+
+	  http://cirrus.com/en/products/arm9.html
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
