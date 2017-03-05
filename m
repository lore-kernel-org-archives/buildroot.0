From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 00:10:23 +0000
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2017a
Message-ID: <1488672624-21405-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 6fe27bd..fa9e88c 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-November/000044.html
-sha512 cac19dded22ff80cd784641ac239358c28cce535ac1eb60b52b7e51c6e9e5fe5f795ea0252daf32c949dddb9c5b24d7e4456d7869aa2725d49c5af58b564822a	tzcode2016j.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-February/000045.html
+sha512 36d744debd5263b6be39b3a9a146b7db1876f216a4bfc62b46631745861a9c03eda3220f213def86c724d3a11c41398c65c2e5d013ff2c1900e7bfc5e7844025	tzcode2017a.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index ed7b04e..2419c0c 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016j
+ZIC_VERSION = 2017a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.7.4
