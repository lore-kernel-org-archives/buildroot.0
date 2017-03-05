From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 00:10:24 +0000
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2017a
In-Reply-To: <1488672624-21405-1-git-send-email-martin@barkynet.com>
References: <1488672624-21405-1-git-send-email-martin@barkynet.com>
Message-ID: <1488672624-21405-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index b98e579..b49eb3c 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-November/000044.html
-sha512 ce0b9958b764479fac7df6b5ba0933fc4c6d815ebccc2537c75c4be105691cd58054704eebfb50ca755d7d48504480d4925ce8836eb499ae4798e3d5503d7e0e	tzdata2016j.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-February/000045.html
+sha512 fe57930711998a0755749a2bf1b32fdbc9e6ee249762017beea52eae7e521236396300fe2d79298fd81eb6d73fb7567884c35995ed248be06188329d937e3873	tzdata2017a.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index d628514..7e63bac 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016j
+TZDATA_VERSION = 2017a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.7.4
