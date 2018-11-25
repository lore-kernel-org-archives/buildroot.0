From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:33:58 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libnspr: bump version to
 4.19
Message-ID: <20181125224645.BA70688517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08e03ffd28fcc51f3720bf0fc18846a28f655fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb521b5d45dc74463a5fb30657642d328e3d51cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 46c091e0da..3067afd720 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.17/src/SHA256SUMS
-sha256	590a0aea29412ae22d7728038c21ef2ab42646e48172a47d2e4bb782846d1095  nspr-4.17.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.19/src/SHA256SUMS
+sha256	2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729  nspr-4.19.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 0c782ae309..14381bb5e8 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.17
+LIBNSPR_VERSION = 4.19
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
