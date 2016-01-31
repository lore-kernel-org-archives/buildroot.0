From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:12:54 +0100
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016a
Message-ID: <20160201224714.134167F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=214f356351be730c0eabd0bb3b018ab28e277885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 1ab8334..80c5812 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
-sha512  ad7de0e3e8753861d260f0fcbcbca327516a4dc826f7659370a7fb979e6154f1a26b23d2609acf6e1790c8c59da0b76c42f4a94bf361409c1460f6a8ffa6f879  tzdata2015g.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
+sha512  9aa5f61a73afa5070dfb1d1982945d268ea8215663d0cd594216500aff14797ea5591ccfd488dc2280902fa1820bf782623624912b669873728431258fe10ec1  tzdata2016a.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 39fc262..bd3cb67 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015g
+TZDATA_VERSION = 2016a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
