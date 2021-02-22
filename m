From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Feb 2021 18:52:02 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.62
Message-ID: <20210222175202.384731-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.62_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index ad632f724a..85c694bc66 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_61_RTM/src/SHA256SUMS
-sha256  312e2d804b34ccf0fec70b57cf8cd6ac853f8ced60df53e30ebb0a7bcd0e1370  nss-3.61.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_62_RTM/src/SHA256SUMS
+sha256  86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478  nss-3.62.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3bc3197e34..07991ae786 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.61
+LIBNSS_VERSION = 3.62
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
