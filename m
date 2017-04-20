From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:25:54 +0200
Subject: [Buildroot] [git commit] zic: bump to version 2017b
Message-ID: <20170420202835.7F030804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be7c0d7d247e76242b92127c7bd167ea25952d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Martin Bark <martin@barkynet.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index fa9e88c..1a68887 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-February/000045.html
-sha512 36d744debd5263b6be39b3a9a146b7db1876f216a4bfc62b46631745861a9c03eda3220f213def86c724d3a11c41398c65c2e5d013ff2c1900e7bfc5e7844025	tzcode2017a.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-March/000046.html
+sha512 9a73af4b868506d1f6287a8285dea489e68f6828da19509114f9144e2a2019c7fd28f4fb98ea907030d11d011ce3a87d99dbe43bca218beddafff151f0d61df1	tzcode2017b.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 2419c0c..de2f3c9 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2017a
+ZIC_VERSION = 2017b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
