From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:01:23 +0200
Subject: [Buildroot] [git commit] zic: bump to version 2016e
Message-ID: <20160615210133.3984280E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6c883b85220a2af1c87b2ace1c08bb706612968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index be790d7..7a231a8 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-April/000038.html
-sha512  c6f6259a78fadaab293be0a4123c226d1a327588639cfa8dadb5a74bd58552892a0c87cfd3a33888f886f51aff34465c89505f0892e6bcbe24247a9160e7328c  tzcode2016d.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-June/000039.html
+sha512	dcaf615ada96920e60ffb336253f53541861153decc156d41661f43e0bfb128c6c231b0b776bbe3f2176549346275fc5a879074f4977d5141228e58cb33a41c6	tzcode2016e.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index d9cdb4d..2e7d1cc 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016d
+ZIC_VERSION = 2016e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
