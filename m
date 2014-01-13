From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 09:20:36 +0100
Subject: [Buildroot] [git commit] jasper: fix file header comment
Message-ID: <20140113082148.46DD59C49A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1eac073b3afa4209f93a93cb8c7dcb84f72af488
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 5092ab3..b349cfc 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jasper
 #
-#############################################################
+################################################################################
 
 JASPER_VERSION = 1.900.1
 JASPER_SITE = http://sources.openelec.tv/devel
