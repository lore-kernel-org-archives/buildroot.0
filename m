From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 17:17:59 +0100
Subject: [Buildroot] [git commit] libnspr: bump to version 4.13.1
Message-ID: <20170109163505.441D17F909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a99f0b0a8e821c0bfc678737745ae8beda8189f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reverts a non-backwards compatible change to the pipe handling:
https://bugzilla.redhat.com/show_bug.cgi?id=1383918

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 36203ac..a4b19b7 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.13/src/SHA256SUMS
-sha256	19c33334bb3fa6d24800ffa65d7d806c54ad5f8c3758a5c11352ad43212ab181	nspr-4.13.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.13.1/src/SHA256SUMS
+sha256	5e4c1751339a76e7c772c0c04747488d7f8c98980b434dc846977e43117833ab	nspr-4.13.1.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 3cf3fe9..d95f970 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.13
+LIBNSPR_VERSION = 4.13.1
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
