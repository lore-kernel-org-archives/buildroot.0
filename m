From: Martin Bark <martin@barkynet.com>
Date: Thu, 17 May 2018 10:38:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2018e
Message-ID: <20180517093810.23075-1-martin@barkynet.com>
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
index df578fe1b3..6b7994731c 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2018-January/000048.html
-sha512 21988e876479e38661d41ea4c7b5218ba14b979739d7ba8d49a2d343bb9f37c654056ab21c046a6652715f012e4ca33c4aa109b1ec3ac5d0244dd3a7ea9ed6d2	tzcode2018c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
+sha512 4a245cae2d0922b24539a94cf4a8ccc2bba1ee696e0aaefecb41c7c8d78724a7fcea6039909336177b8b26fec8fc47719e3e56ca9839dbaf52f9a4fec84d4717	tzcode2018e.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index aba8bc5b3f..224b7ab407 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2018c
+ZIC_VERSION = 2018e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.17.0
