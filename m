From: Alexander Dahl <post@lespocky.de>
Date: Mon, 27 Apr 2020 09:11:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/tzdata: bump to version 2020a
In-Reply-To: <20200427071144.30237-1-post@lespocky.de>
References: <20200427071144.30237-1-post@lespocky.de>
Message-ID: <20200427071144.30237-2-post@lespocky.de>
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
index e2338f13fe..9cc000d76e 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html
-sha512 2921cbb2fd44a6b8f7f2ed42c13fbae28195aa5c2eeefa70396bc97cdbaad679c6cc3c143da82cca5b0279065c02389e9af536904288c12886bf345baa8c6565 tzdata2019c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html
+sha512 2a2fc2e3ad8a6e4c574242296c847ad582c2c1d86add9c556e65c812d19b9528522e3c4dddb5239017091825d2acc5a2ccaf21dc41b900b6c300ef4264cc5a9d tzdata2020a.tar.gz
 # Locally computed:
 sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index b656bc7f7f..b405f895cd 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2019c
+TZDATA_VERSION = 2020a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.11.0
