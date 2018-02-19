From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:32:43 +0100
Subject: [Buildroot] [git commit] zic: bump to 2018c
Message-ID: <20180219193552.2007487FFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c628cade95d3456a926da92c5c4d073765685ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index e7eef7aea0..df578fe1b3 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-October/000047.html
-sha512 0d8c3e07b0de9015a137602450468ceb6358312a50eeda2a860882367107b8ba9ef275880b292570a671b9910afc54e6209e1e642387d246bc9c08c4ff660ffb	tzcode2017c.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2018-January/000048.html
+sha512 21988e876479e38661d41ea4c7b5218ba14b979739d7ba8d49a2d343bb9f37c654056ab21c046a6652715f012e4ca33c4aa109b1ec3ac5d0244dd3a7ea9ed6d2	tzcode2018c.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a2f27e44a3..aba8bc5b3f 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2017c
+ZIC_VERSION = 2018c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
