From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 15:29:43 +0100
Subject: [Buildroot] [git commit] minicom: bump version
Message-ID: <20120311143002.9955290D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edd2748149ee386aeb336ed3584dacbb596bf490
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/minicom/minicom.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index cb09b83..ab65bb6 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -3,9 +3,9 @@
 # minicom
 #
 #############################################################
-MINICOM_VERSION = 2.6
+MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/3689/
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkg-config as a dependency, simply
