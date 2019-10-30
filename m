From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:40:57 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libnss: bump
 version to 3.46.1
Message-ID: <20191030102014.78E158DF43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebfcce70be508ad190a9ebce9ba3c5a9aa0fcd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.46.1_release_notes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d7903b227d6cad2ee177513cd64016d6a16b040)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 678f39b090..53c20149a0 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_42_1_RTM/src/SHA256SUMS
-sha256	6b699649d285602ba258a4b0957cb841eafc94eff5735a9da8da0adbb9a10cef  nss-3.46.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_46_1_RTM/src/SHA256SUMS
+sha256	3bf7e0ed7db98803f134c527c436cc68415ff17257d34bd75de14e9a09d13651  nss-3.46.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 776f232ad5..5bbd013538 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.46
+LIBNSS_VERSION = 3.46.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
