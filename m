From: Alexander Dahl <post@lespocky.de>
Date: Thu, 12 Sep 2019 11:14:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/tzdata: bump version to 2019c
In-Reply-To: <20190912091432.13904-1-post@lespocky.de>
References: <20190912091432.13904-1-post@lespocky.de>
Message-ID: <20190912091432.13904-2-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index b21e195b43..e2338f13fe 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
-sha512 c0104078d994e501d80a41bea31364b1390a75c2fbf42968a8343a090e2ac2eddbc58770ca470b192ea19dec89fcc634141a1de703ea2ffa0325176a64afe1fc tzdata2019b.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html
+sha512 2921cbb2fd44a6b8f7f2ed42c13fbae28195aa5c2eeefa70396bc97cdbaad679c6cc3c143da82cca5b0279065c02389e9af536904288c12886bf345baa8c6565 tzdata2019c.tar.gz
 # Locally computed:
 sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 14f25e8766..4d097dbee9 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2019b
+TZDATA_VERSION = 2019c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.11.0
