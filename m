From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 10 Apr 2020 20:53:33 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.51.1
Message-ID: <20200410185333.65973-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.51.1_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7f496311f4..dfeae24278 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_51_RTM/src/SHA256SUMS
-sha256	75348b3b3229362486c57a880db917da1f96ef4eb639dc9cc2ff17d72268459c  nss-3.51.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_51_1_RTM/src/SHA256SUMS
+sha256	085c5eaceef040eddea639e2e068e70f0e368f840327a678ef74ae3d6c15ca78  nss-3.51.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3b12e8c41d..81ebb7ad03 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.51
+LIBNSS_VERSION = 3.51.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.20.1
