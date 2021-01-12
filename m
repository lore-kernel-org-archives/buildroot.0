From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 12 Jan 2021 08:13:00 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.60.1
Message-ID: <20210112071300.1663147-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.60.1 and remove local patch that has been upstreamed.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.60_1_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 16a2e5c521..f93fa5ad03 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_60_RTM/src/SHA256SUMS
-sha256  84abd5575ab874c53ae511bd461e5d0868d1a1b384ee40753154cdd1d590fe3d  nss-3.60.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_60_1_RTM/src/SHA256SUMS
+sha256  2051c20b61112df24bad533ac37f6c66c1bc0d6ea70bb9d9cad102d20324279d  nss-3.60.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d762ac6f64..fc1be6f603 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.60
+LIBNSS_VERSION = 3.60.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
