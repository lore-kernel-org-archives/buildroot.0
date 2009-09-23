From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] Remove unneeded trailing slash from
	TOPDIR
Message-ID: <20090923073604.AD73C777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=483b2980d0559932a6428fa4655dc38756688489
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
