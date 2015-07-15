From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 13:13:46 -0300
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.19.2
Message-ID: <1436976826-22602-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-2730, CVE-2015-2721, and probably others.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1f76f03..2336590 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_4_RTM/src/SHA256SUMS
-sha256	1d98ad1881a4237ec98cbe472fc851480f0b0e954dfe224d047811fb96ff9d79	nss-3.17.4.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RTM/src/SHA256SUMS
+sha256	1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae	nss-3.19.2.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index db272b3..0821804 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.17.4
+LIBNSS_VERSION = 3.19.2
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.3.6
