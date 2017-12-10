From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:56:34 +0100
Subject: [Buildroot] [git commit] package/heimdal: bump version to 7.5.0
Message-ID: <20171210195454.3146880FCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87ae2ac1ccc636b81341b51ea5e68ad257e46485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes CVE-2017-17439:
https://github.com/heimdal/heimdal/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.hash | 2 +-
 package/heimdal/heimdal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index a0e0f3f..ac26aa6 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3de14ecd36ad21c1694a13da347512b047f4010d176fe412820664cb5d1429ad  heimdal-7.4.0.tar.gz
+sha256 c5a2a0030fcc728022fa2332bad85569084d1c3b9a59587b7ebe141b0532acad  heimdal-7.5.0.tar.gz
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 5732556..79aaacb 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.4.0
+HEIMDAL_VERSION = 7.5.0
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
