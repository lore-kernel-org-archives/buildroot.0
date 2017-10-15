From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 23:01:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnspr: bump to version
	4.15
Message-ID: <20171015205800.7BDA47FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59af8829ae083ace1bb6fcd716df0dce662943a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f234748a48d5640c8d1f4a84fcb1b5b9ac5bd77d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 9111a32..13cee6e 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.14/src/SHA256SUMS
-sha256	64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5	nspr-4.14.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.15/src/SHA256SUMS
+sha256	27dde06bc3d0c88903a20d6ad807361a912cfb624ca0ab4efb10fc50b19e2d80	nspr-4.15.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index f891bb3..899aec1 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.14
+LIBNSPR_VERSION = 4.15
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
