From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:04:33 +0200
Subject: [Buildroot] [git commit] libnss: bump to version 3.27.1
Message-ID: <20161013060802.3107D82269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ccdc270eeb72de718afa348f2a362c79ba0579d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8e03faf..acc32e3 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_23_RTM/src/SHA256SUMS
-sha256	94b383e31c9671e9dfcca81084a8a813817e8f05a57f54533509b318d26e11cf	nss-3.23.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_1_RTM/src/SHA256SUMS
+sha256	fd3637a1930cd838239a89633a7ed9a18859ae9b599043f3a18f726dc4ec2a6b	nss-3.27.1.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e2bbf1f..b4f9cce 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.23
+LIBNSS_VERSION = 3.27.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
