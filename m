From: Martin Bark <martin@barkynet.com>
Date: Thu, 17 May 2018 10:38:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2018e
In-Reply-To: <20180517093810.23075-1-martin@barkynet.com>
References: <20180517093810.23075-1-martin@barkynet.com>
Message-ID: <20180517093810.23075-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index cfcd49ef26..6a0ea17ce9 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2018-January/000048.html
-sha512 0575c87c9ffcde7b7f62b0df928d8a0e8d93f832b5ef7227b3d8431686f851f1fd5372c7e768f2979830352433b31df7f3979a00c28ea3973a3a0987ebbfb835	tzdata2018c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
+sha512 d059fcd381b2f6ecdafcd68fdd2a00451d1bf9b1affeb164ae7cabca2e022d499e77f0706ec3f3091b8e84c2211aa66da6c90937108771f1bf070cfebc105cae	tzdata2018e.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 28323e84e7..e20c946208 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2018c
+TZDATA_VERSION = 2018e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.17.0
