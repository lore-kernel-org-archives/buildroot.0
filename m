From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 29 Dec 2017 18:10:22 -0500
Subject: [Buildroot] [PATCH 1/1] gperf: bump to 3.1
Message-ID: <20171229231022.25564-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gperf/gperf.hash | 3 ++-
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 370235c627..218a24e562 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
+sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2	gperf-3.1.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 2a6192a48b..4b928a0ebd 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.0.4
+GPERF_VERSION = 3.1
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
-- 
2.14.3
