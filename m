From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 18:20:10 +0200
Subject: [Buildroot] [git commit] xfsprogs: bump version
Message-ID: <20120405162117.C3C4A96A0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32f5d03a6e80484d65e88914b993995916488ab8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xfsprogs/xfsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index c59d4d8..784f9b6 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,7 +3,7 @@
 # xfsprogs
 #
 #############################################################
-XFSPROGS_VERSION = 3.1.7
+XFSPROGS_VERSION = 3.1.8
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
