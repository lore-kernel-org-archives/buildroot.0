From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:34:39 +0100
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016c
Message-ID: <20160326203451.BAE447FB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0c3f60dac237dff5b564b9d3464a2c3121b95ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
