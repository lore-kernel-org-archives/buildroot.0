From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:02:03 +0100
Subject: [Buildroot] [git commit] package/libjpeg: add LIBJPEG_CPE_ID_VENDOR
Message-ID: <20210121204359.045EB821D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91a19ca8914750bf7f9147e21820362715a6441f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ijg:libjpeg is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aijg%3Alibjpeg

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjpeg/libjpeg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b855344f3c..389ecb6299 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,6 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
+LIBJPEG_CPE_ID_VENDOR = ijg
 LIBJPEG_PROVIDES = jpeg
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
