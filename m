From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 21:00:03 +0100
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016b
Message-ID: <20160315200037.836467FA1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16669e786f9f805ae9c7767f16f5116a6bd19dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 80c5812..f8e06e8 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-January/000035.html
-sha512  9aa5f61a73afa5070dfb1d1982945d268ea8215663d0cd594216500aff14797ea5591ccfd488dc2280902fa1820bf782623624912b669873728431258fe10ec1  tzdata2016a.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000036.html
+sha512  6d30215ba3289a5b85a632d635b76a54c3c08d97e426d6bd89f83c4efd252e43959593b21cca9d2b185f3845358908946cc308365accbee94f126ad3057cf838  tzdata2016b.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index bd3cb67..67a7c9c 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016a
+TZDATA_VERSION = 2016b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
