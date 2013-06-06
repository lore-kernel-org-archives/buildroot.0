From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:05:12 +0200
Subject: [Buildroot] [git commit] linenoise: fix github tarball to use
	commit id
Message-ID: <20130606211255.08E629A9A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b89e8141e3247e28387e14a2959d3ec8ea11f12c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linenoise/linenoise.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 0265e10..01bfa0c 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LINENOISE_VERSION = g27a3b4d
-LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
+LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
 
