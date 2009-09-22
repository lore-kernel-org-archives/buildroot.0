From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 01:30:34 +0200
Subject: [Buildroot] [PATCH 4/4] Remove unneeded trailing slash from TOPDIR
Message-ID: <1253662234-11786-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 176992c..192fdf2 100644
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,7 @@
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
-TOPDIR=./
+TOPDIR:=.
 CONFIG_CONFIG_IN=Config.in
 CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
-- 
1.6.3.3
