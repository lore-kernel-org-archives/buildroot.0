From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 Oct 2015 08:38:49 -0300
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.20
In-Reply-To: <1443872329-31417-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443872329-31417-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1443872329-31417-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 2336590..9e24786 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RTM/src/SHA256SUMS
-sha256	1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae	nss-3.19.2.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_20_RTM/src/SHA256SUMS
+sha256	5e38d4b9837ca338af966b97fc91c07f67ad647fb38dc4af3cfd0d84e477d15c	nss-3.20.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0821804..f283bb3 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.19.2
+LIBNSS_VERSION = 3.20
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.4.9
