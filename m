From: Martin Bark <martin@barkynet.com>
Date: Wed, 12 Aug 2015 22:10:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/zic: bump version to 2015f
In-Reply-To: <1439413807-12441-1-git-send-email-martin@barkynet.com>
References: <1439413807-12441-1-git-send-email-martin@barkynet.com>
Message-ID: <1439413807-12441-2-git-send-email-martin@barkynet.com>
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
index 3ddd6f8..67a6c6d 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From 2015e release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-June/000032.html
-sha512  fdc568a68f4876b967b39e21fa53f063dc5756e886e2a273cc046d5a014eb517e9c91eb6e03d18c94a89ce48578868aed710790415c500188fce4e4add0ce7ca  tzcode2015e.tar.gz
+# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
+sha512  5cfbebde8a0be57e8388a7b6d35aeba99130a72c1a41f9bbd5d5864511a473aa5e9320ab21055b4383e64b3b9d7682c0d30377ce8407619987be672436014710  tzcode2015f.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 03e023a..e4cc1d3 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2015e
+ZIC_VERSION = 2015f
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.1.4
