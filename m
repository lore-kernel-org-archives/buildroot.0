From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:10 -0000
Subject: [Buildroot] [git commit branch/next] ethtool: bump version
Message-ID: <20120802195239.A532B800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4eb73c5337203b9228c08a90f19510dafee2c20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release:
* Fix: Work around failure of ETHTOOL_GSSET_INFO for unprivileged
  users (-k option)
* Fix: Report any unexpected error code from ETHTOOL_GSSET_INFO
  (-k and -K options)
* Doc: Fix the date of the man page to match the last update

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index b6cbc64..bbbcf1e 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.4
+ETHTOOL_VERSION = 3.4.1
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
 $(eval $(call AUTOTARGETS))
