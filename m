From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 08:24:48 +0100
Subject: [Buildroot] [git commit] tzdata: bump to 2018c
Message-ID: <20180203072712.8CDB98824D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16977664300599cb4ac5c23b6b19382608a019f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 277acd69f9..cfcd49ef26 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-October/000047.html
-sha512 feb5c544e617b30c73a397e5a1c51f9847d0fddf1dfa0f9ace2e6f686786f09b666937b2048e07075c84593fc584bd5a25d639fce70eca9735267df28621ab4c	tzdata2017c.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2018-January/000048.html
+sha512 0575c87c9ffcde7b7f62b0df928d8a0e8d93f832b5ef7227b3d8431686f851f1fd5372c7e768f2979830352433b31df7f3979a00c28ea3973a3a0987ebbfb835	tzdata2018c.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 9bb4b4f26b..28323e84e7 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2017c
+TZDATA_VERSION = 2018c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
