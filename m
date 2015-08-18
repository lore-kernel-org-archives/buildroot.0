From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:55:52 +0200
Subject: [Buildroot] [git commit] package/zic: bump version to 2015f
Message-ID: <20150901083107.29E4D7F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b38a6d5c027baae025c6eacb9dbd7b273524c417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash |    4 ++--
 package/zic/zic.mk   |    2 +-
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
