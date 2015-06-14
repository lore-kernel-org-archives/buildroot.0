From: Martin Bark <martin@barkynet.com>
Date: Sun, 14 Jun 2015 15:08:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/zic: bump version to 2015e
In-Reply-To: <1434290896-17390-1-git-send-email-martin@barkynet.com>
References: <1434290896-17390-1-git-send-email-martin@barkynet.com>
Message-ID: <1434290896-17390-2-git-send-email-martin@barkynet.com>
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
index 6f7911a..3ddd6f8 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256  7feeb1a60dff8b179c884f6e3aa7684606f4eaeb7f7ecc61a6bb81e3e38af42e  tzcode2015c.tar.gz
+# From 2015e release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-June/000032.html
+sha512  fdc568a68f4876b967b39e21fa53f063dc5756e886e2a273cc046d5a014eb517e9c91eb6e03d18c94a89ce48578868aed710790415c500188fce4e4add0ce7ca  tzcode2015e.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 5e84567..a768ac6 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2015c
+ZIC_VERSION = 2015e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
-- 
2.1.4
