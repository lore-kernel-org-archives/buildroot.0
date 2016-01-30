From: Martin Bark <martin@barkynet.com>
Date: Sat, 30 Jan 2016 14:52:23 +0000
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2016a
In-Reply-To: <1454165543-32439-1-git-send-email-martin@barkynet.com>
References: <1454165543-32439-1-git-send-email-martin@barkynet.com>
Message-ID: <1454165543-32439-2-git-send-email-martin@barkynet.com>
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
index 1ab8334..80c5812 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
-sha512  ad7de0e3e8753861d260f0fcbcbca327516a4dc826f7659370a7fb979e6154f1a26b23d2609acf6e1790c8c59da0b76c42f4a94bf361409c1460f6a8ffa6f879  tzdata2015g.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
+sha512  9aa5f61a73afa5070dfb1d1982945d268ea8215663d0cd594216500aff14797ea5591ccfd488dc2280902fa1820bf782623624912b669873728431258fe10ec1  tzdata2016a.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 39fc262..bd3cb67 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015g
+TZDATA_VERSION = 2016a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.5.0
