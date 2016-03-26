From: Martin Bark <martin@barkynet.com>
Date: Sat, 26 Mar 2016 20:18:46 +0000
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2016c
In-Reply-To: <1459023526-22241-1-git-send-email-martin@barkynet.com>
References: <1459023526-22241-1-git-send-email-martin@barkynet.com>
Message-ID: <1459023526-22241-2-git-send-email-martin@barkynet.com>
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
index f8e06e8..4d4254d 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000036.html
-sha512  6d30215ba3289a5b85a632d635b76a54c3c08d97e426d6bd89f83c4efd252e43959593b21cca9d2b185f3845358908946cc308365accbee94f126ad3057cf838  tzdata2016b.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000037.html
+sha512  03eab77c8b3176da1dd17d1d9062b151036b01d224f1e4b60f34a2db6899150431f34f4d9f39652648aae3a55326fd6f85d6deefe3f27b36eaed9ef39ed3f53c  tzdata2016c.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 67a7c9c..1b3efb4 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016b
+TZDATA_VERSION = 2016c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.5.0
