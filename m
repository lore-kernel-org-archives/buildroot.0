From: Martin Bark <martin@barkynet.com>
Date: Tue, 15 Mar 2016 10:04:53 +0000
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2016b
Message-ID: <1458036294-21996-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 290cfdb..203544d 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
-sha512  33a1078ba16aef19048aa97ce1816fc5368061bfe40eddc0e7e246ca57c4a535eaf2f03847128e971a6d959f34ea77224bf33fd53dc6a0c006450dde35222223  tzcode2016a.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000036.html
+sha512  53f7405fd0466f5acc5d1dd590546abb6e3f4240d6a78ce7e965908d9310e8b8686c8fbe887947c513a4de65e3e3fc038d64215a330267397f37e6efce71f0b8  tzcode2016b.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 6f5d160..1667667 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016a
+ZIC_VERSION = 2016b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.5.0
