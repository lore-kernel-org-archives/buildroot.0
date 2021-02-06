From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 16:59:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: set GNUPLOT_CPE_ID_VALID
Message-ID: <20210206155952.2004876-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnuplot_project:gnuplot is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnuplot_project%3Agnuplot

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuplot/gnuplot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index bebaf1fa76..8d096c6102 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,6 +8,7 @@ GNUPLOT_VERSION = 5.4.1
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
+GNUPLOT_CPE_ID_VALID = YES
 
 GNUPLOT_AUTORECONF = YES
 
-- 
2.29.2
