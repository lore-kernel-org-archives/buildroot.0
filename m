From: Martin Bark <martin@barkynet.com>
Date: Sat,  3 Dec 2016 14:36:27 +0000
Subject: [Buildroot] [PATCH 3/3] package/tzdata: bump version to 2016j
In-Reply-To: <1480775787-28111-1-git-send-email-martin@barkynet.com>
References: <1480775787-28111-1-git-send-email-martin@barkynet.com>
Message-ID: <1480775787-28111-3-git-send-email-martin@barkynet.com>
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
index 1d7fbcd..b98e579 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-July/000040.html
-sha512 0472f9516b6c3d83c0a5d0953a5535f4c48d9b9171e125f528188dac512f3556bc1805b7029c4f467a122cbce1beb4e804dd4ae63b259952de3bb217f8e8941d	tzdata2016f.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-November/000044.html
+sha512 ce0b9958b764479fac7df6b5ba0933fc4c6d815ebccc2537c75c4be105691cd58054704eebfb50ca755d7d48504480d4925ce8836eb499ae4798e3d5503d7e0e	tzdata2016j.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index de7d1be..d628514 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016f
+TZDATA_VERSION = 2016j
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.7.4
