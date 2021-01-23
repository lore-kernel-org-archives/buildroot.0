From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:34:33 +0100
Subject: [Buildroot] [git commit] package/chartjs: add CPE variables
Message-ID: <20210123201521.1B988816C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05cc9e967c02cd031f1f671b97fced1737317337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:chartjs:chart.js is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Achartjs%3Achart.js

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chartjs/chartjs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 82c86dc6cc..2748a94d36 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -8,6 +8,8 @@ CHARTJS_VERSION = 2.9.4
 CHARTJS_SITE = $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
 CHARTJS_LICENSE = MIT
 CHARTJS_LICENSE_FILES = LICENSE.md
+CHARTJS_CPE_ID_VENDOR = chartjs
+CHARTJS_CPE_ID_PRODUCT = chart.js
 
 define CHARTJS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
