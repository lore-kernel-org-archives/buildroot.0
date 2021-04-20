From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:22:29 +0200
Subject: [Buildroot] [git commit] package/gperf: add _CPE_ID_VENDOR and
 _CPE_ID_PRODUCT
Message-ID: <20210420205902.ED53B7F93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3712e1dee7626b0c3262c054b5b9c2769fd2a61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gperftools_project:gperftools:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gperftools_project:gperftools

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gperf/gperf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 4b928a0ebd..c2f042c464 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -8,6 +8,8 @@ GPERF_VERSION = 3.1
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
+GPERF_CPE_ID_VENDOR = gperftools_project
+GPERF_CPE_ID_PRODUCT = gperftools
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
