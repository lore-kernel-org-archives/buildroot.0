From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:20:04 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016d
Message-ID: <20160419192009.516EA80AC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2f4b6c5e5b97fdea0230615d02b74454556d8a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 4d4254d..1529fd4 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000037.html
-sha512  03eab77c8b3176da1dd17d1d9062b151036b01d224f1e4b60f34a2db6899150431f34f4d9f39652648aae3a55326fd6f85d6deefe3f27b36eaed9ef39ed3f53c  tzdata2016c.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-April/000038.html
+sha512  f1beb1793c4c7d18f2dadaf4a928b1476f66b400bda0c87b06155c0dd1c4b4a26bb2f37dc17a3676a2bbe9c1e71a5d8b27a171c797a86464b0bc0d13abfb2f99  tzdata2016d.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 1b3efb4..69bae03 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016c
+TZDATA_VERSION = 2016d
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
