From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 24 Jan 2020 20:57:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.49.2
In-Reply-To: <20200124195704.115545-1-giulio.benetti@benettiengineering.com>
References: <20200124195704.115545-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200124195704.115545-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.49.2_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 01098df99a..dc04acbb6e 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_48_RTM/src/SHA256SUMS
-sha256	d9aa42e49e02bb0dc0a2f164604cfc718e11a2a06ddb266cd676376ac21b026e  nss-3.49.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_49_2_RTM/src/SHA256SUMS
+sha256	faa7502c3ce9240d4be2aa88f63d88cf7d1cc512060e63ef21a7813c236160b2  nss-3.49.2.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d7d3cda86b..11b57d8142 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.49.1
+LIBNSS_VERSION = 3.49.2
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.20.1
