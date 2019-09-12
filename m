From: Alexander Dahl <post@lespocky.de>
Date: Thu, 12 Sep 2019 11:14:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/zic: bump verstion to 2019c
In-Reply-To: <20190912091432.13904-1-post@lespocky.de>
References: <20190912091432.13904-1-post@lespocky.de>
Message-ID: <20190912091432.13904-3-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 48591795aa..cb6300e855 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
-sha512 bcfb417fe3b7c39e702da0090291db0489744f733010ae183007fce5e441bfce885fb25ed11730cf7f363572e107d7ff0c4b38691bb99def2d8cf7017c05720f tzcode2019b.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html
+sha512 61ef36385f501c338c263081486de0d1fccd454b86f8777b0dbad4ea3f21bbde059d0a91c23e207b167ed013127d3db8b7528f0188814a8b44d1f946b19d9b8b tzcode2019c.tar.gz
 # Locally computed:
 sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 6f3d9d80ac..baa6479154 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2019b
+ZIC_VERSION = 2019c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.11.0
