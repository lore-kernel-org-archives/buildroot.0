From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:53:39 +0200
Subject: [Buildroot] [git commit] package/zic: bump version to 2015g
Message-ID: <20151012155506.B21E181E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=822478735e36c32e38a68852c63acd850f9b472c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash |    4 ++--
 package/zic/zic.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 67a6c6d..714b00c 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
-sha512  5cfbebde8a0be57e8388a7b6d35aeba99130a72c1a41f9bbd5d5864511a473aa5e9320ab21055b4383e64b3b9d7682c0d30377ce8407619987be672436014710  tzcode2015f.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
+sha512  44da833da3afdb82636a953785372bb4c765e61e40d700da40b46ab70007ebdbde4d480e10b87cbb36c45eaaffcaa6b9894375e2f553b7d16655dc167cd4a11f  tzcode2015g.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index e4cc1d3..0bcb800 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2015f
+ZIC_VERSION = 2015g
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_STRIP_COMPONENTS = 0
