From: Martin Bark <martin@barkynet.com>
Date: Sat, 26 Mar 2016 20:18:45 +0000
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2016c
Message-ID: <1459023526-22241-1-git-send-email-martin@barkynet.com>
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
index 203544d..07c631b 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000036.html
-sha512  53f7405fd0466f5acc5d1dd590546abb6e3f4240d6a78ce7e965908d9310e8b8686c8fbe887947c513a4de65e3e3fc038d64215a330267397f37e6efce71f0b8  tzcode2016b.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000037.html
+sha512  813309b46e4214cbe7d22b9951bad15536f5d394d2f651b60ae66c14dd8c232d51991ad80f7f02c324f896e680c7efb0321a9e4799c96735f1a82e258a87dff7  tzcode2016c.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 1667667..b0c3fcf 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016b
+ZIC_VERSION = 2016c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.5.0
