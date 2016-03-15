From: Martin Bark <martin@barkynet.com>
Date: Tue, 15 Mar 2016 10:04:54 +0000
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2016b
In-Reply-To: <1458036294-21996-1-git-send-email-martin@barkynet.com>
References: <1458036294-21996-1-git-send-email-martin@barkynet.com>
Message-ID: <1458036294-21996-2-git-send-email-martin@barkynet.com>
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
index 80c5812..f8e06e8 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
-sha512  9aa5f61a73afa5070dfb1d1982945d268ea8215663d0cd594216500aff14797ea5591ccfd488dc2280902fa1820bf782623624912b669873728431258fe10ec1  tzdata2016a.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000036.html
+sha512  6d30215ba3289a5b85a632d635b76a54c3c08d97e426d6bd89f83c4efd252e43959593b21cca9d2b185f3845358908946cc308365accbee94f126ad3057cf838  tzdata2016b.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index bd3cb67..67a7c9c 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016a
+TZDATA_VERSION = 2016b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.5.0
