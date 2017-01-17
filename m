From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Date: Tue, 17 Jan 2017 12:47:50 +0100
Subject: [Buildroot] [PATCH] gperf: bump to version 3.1
Message-ID: <20170117114750.20977-1-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 package/gperf/gperf.hash | 2 +-
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 370235c62..dae834223 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
+sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2  gperf-3.1.tar.gz
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 8ce3c95ff..014a24566 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.0.4
+GPERF_VERSION = 3.1
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPLv3+
 GPERF_LICENSE_FILES = COPYING
-- 
2.11.0
