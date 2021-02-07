From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:38:30 +0100
Subject: [Buildroot] [git commit] package/gnuplot: set GNUPLOT_CPE_ID_VALID
Message-ID: <20210207092050.27C0981965@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2124fc7e159085a4d9abf230b064ed67bdcc7d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnuplot_project:gnuplot is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnuplot_project%3Agnuplot

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
