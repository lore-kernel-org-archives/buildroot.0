From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 31 May 2021 12:29:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.66
In-Reply-To: <20210531102947.7501-1-giulio.benetti@benettiengineering.com>
References: <20210531102947.7501-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210531102947.7501-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note: NSS 3.66 requires NSPR 4.31.
Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.66_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02fda14eec..7b27d859b2 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_65_RTM/src/SHA256SUMS
-sha256  32170f6c188212a78bf9fdacffa2eeed0d564ef8faae63fd8ae971b208e8c637  nss-3.65.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_66_RTM/src/SHA256SUMS
+sha256  89a79e3a756cf0ac9ba645f4d4c0fc58d4133134401fb0b6c8a74c420bb4cdc9  nss-3.66.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 90f30698ff..c5398c2959 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.65
+LIBNSS_VERSION = 3.66
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
