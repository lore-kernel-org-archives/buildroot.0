From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:20:00 +0200
Subject: [Buildroot] [git commit] package/zic: bump version to 2016d
Message-ID: <20160419192009.4371C80AC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c01aa2b21872b82f0b0336e25e86066f479ebf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 07c631b..be790d7 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-March/000037.html
-sha512  813309b46e4214cbe7d22b9951bad15536f5d394d2f651b60ae66c14dd8c232d51991ad80f7f02c324f896e680c7efb0321a9e4799c96735f1a82e258a87dff7  tzcode2016c.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2016-April/000038.html
+sha512  c6f6259a78fadaab293be0a4123c226d1a327588639cfa8dadb5a74bd58552892a0c87cfd3a33888f886f51aff34465c89505f0892e6bcbe24247a9160e7328c  tzcode2016d.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index b0c3fcf..d9cdb4d 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016c
+ZIC_VERSION = 2016d
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
