From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:14:32 +0200
Subject: [Buildroot] [git commit] libnss: bump to version 3.20
Message-ID: <20151003131736.A03167FCBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=513908ba8f7cc2bf0cc811b4911110dc6933908a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash |    4 ++--
 package/libnss/libnss.mk   |    2 +-
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
