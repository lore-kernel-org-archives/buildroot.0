From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:43:22 +0200
Subject: [Buildroot] [git commit] libnss: bump version to 3.35
Message-ID: <20180330194951.3B84383EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccab9b0edaf6455b909f2f381790e9620f17354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 6c8ce83784..775ef4868c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_33_RTM/src/SHA256SUMS
-sha256	98f0dabd36408e83dd3a11727336cc3cdfee4cbdd9aede2b2831eb2389c284e4  nss-3.33.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_35_RTM/src/SHA256SUMS
+sha256	f4127de09bede39f5fd0f789d33c3504c5d261e69ea03022d46b319b3e32f6fa  nss-3.35.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 27d305cc34..2bef2bcc66 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.33
+LIBNSS_VERSION = 3.35
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
