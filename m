From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:31 -0000
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.65
Message-ID: <20210607144651.D607E81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eadbfeb94806b6d9b69cbc5cbfa9d6468a2eee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.65_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr: release notes not yet available]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 92e9936d0d..02fda14eec 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_64_RTM/src/SHA256SUMS
-sha256  d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126  nss-3.64.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_65_RTM/src/SHA256SUMS
+sha256  32170f6c188212a78bf9fdacffa2eeed0d564ef8faae63fd8ae971b208e8c637  nss-3.65.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 88cc13accf..41d3c04399 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.64
+LIBNSS_VERSION = 3.65
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
