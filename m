From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:25:59 +0200
Subject: [Buildroot] [git commit] tzdata: bump to version 2017b
Message-ID: <20170420202835.8DC65802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b51ed6312db602556f399a872ec95078a7e755b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Martin Bark <martin@barkynet.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index b49eb3c..b8a5cf2 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-February/000045.html
-sha512 fe57930711998a0755749a2bf1b32fdbc9e6ee249762017beea52eae7e521236396300fe2d79298fd81eb6d73fb7567884c35995ed248be06188329d937e3873	tzdata2017a.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-March/000046.html
+sha512 3e090dba1f52e4c63b4930b28f4bf38b56aabd6728f23094cb5801d10f4e464f17231f17b75b8866714bf98199c166ea840de0787b75b2274aa419a4e14bbc4d	tzdata2017b.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 7e63bac..68a0484 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2017a
+TZDATA_VERSION = 2017b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
