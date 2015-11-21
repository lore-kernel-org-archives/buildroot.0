From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Nov 2015 09:29:03 +0100
Subject: [Buildroot] [git commit branch/next] libnspr: bump to version 4.11
Message-ID: <20151121083050.E480E7F9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93239dfdab13a303b9695360605cdb87eb932d09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.hash |    4 ++--
 package/libnspr/libnspr.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0a5ee87..87f6d4f 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.10/src/SHA256SUMS
-sha256	343614971c30520d0fa55f4af0a72578e2d8674bb71caf7187490c3379523107	nspr-4.10.10.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.11/src/SHA256SUMS
+sha256	cb320a9eee7028275ac0fce7adc39dee36f14f02fd8432fce1b7e1aa5e3685c2	nspr-4.11.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 9124ce0..207da4e 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.10.10
+LIBNSPR_VERSION = 4.11
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
