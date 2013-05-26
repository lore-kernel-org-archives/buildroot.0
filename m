From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 21:11:32 +0200
Subject: [Buildroot] [git commit branch/next] libnspr: Bump version to 4.9.6.
Message-ID: <20130526194931.191619A58A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cef036b20d10802fb939218532897195c1ad52e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes the build for aarch64.

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 5b1333d..e934281 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -3,7 +3,7 @@
 # libnspr
 #
 #############################################################
-LIBNSPR_VERSION = 4.9.2
+LIBNSPR_VERSION = 4.9.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub
