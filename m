From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Jan 2019 19:21:49 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to version 0.22.4
Message-ID: <20190103182149.16375-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://www.enlightenment.org/news/e0.22.4_release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 7a6d3ff8f0..4872676bee 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/e0.22.3_release
-sha256	4d81e583073d74474b7a960b01cb596716a43cca2fadca7d1e5c91f4cf6efe9b	enlightenment-0.22.3.tar.xz
+# From https://www.enlightenment.org/news/e0.22.4_release
+sha256	59f4997c8b59457142870e40f137bc08c9735c84368d32213dacf09c4342fe79	enlightenment-0.22.4.tar.xz
 sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 5bc1c5d6de..f0f9834c87 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.22.3
+ENLIGHTENMENT_VERSION = 0.22.4
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
-- 
2.14.5
