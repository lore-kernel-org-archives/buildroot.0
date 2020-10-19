From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 19 Oct 2020 20:56:09 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.58
Message-ID: <20201019185609.137352-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.58. Unfortunately local patch is still pending
upstream and not applied due to Covid-19 latency:
https://bugzilla.mozilla.org/show_bug.cgi?id=1642174

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.58_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e3b584351e..02593c7dde 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_57_RTM/src/SHA256SUMS
-sha256  55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c014df398bdc382  nss-3.57.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_58_RTM/src/SHA256SUMS
+sha256  9f73cf789b5f109b978e5239551b609b0cafa88d18f0bc8ce3f976cb629353c0  nss-3.58.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 21cd65cb8f..8e6a77d2cb 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.57
+LIBNSS_VERSION = 3.58
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
