From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:03:21 +0100
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.49.2
Message-ID: <20200202075252.AFCF28818B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f946eca8ff5abe657e0a6484341c0793d1edb2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.49.2_release_notes

Fixes:
http://autobuild.buildroot.net/results/2687d667467a2f4209af74e6e77073801c716a3b/
http://autobuild.buildroot.net/results/0a46d17d44b69afa8576b7a09ec825319d195489/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
