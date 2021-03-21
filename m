From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 09:53:37 +0100
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.63
Message-ID: <20210321083423.7342E817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0f020f7ae478826c137f90ac43ab415cc7c6425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: NSS 3.63 requires NSPR 4.30.
Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.63_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 85c694bc66..b3e7a2935d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_62_RTM/src/SHA256SUMS
-sha256  86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478  nss-3.62.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_63_RTM/src/SHA256SUMS
+sha256  182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221  nss-3.63.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 07991ae786..9296bdcc18 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.62
+LIBNSS_VERSION = 3.63
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
