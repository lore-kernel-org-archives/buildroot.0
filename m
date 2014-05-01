From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 22:32:37 +0200
Subject: [Buildroot] [git commit] package .mk files: use 80 # signs in header
Message-ID: <20140501204656.5C9B89CAA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f8399c32a7cf43fd9c4adc1328bbd17ba123ae0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk                       |    4 ++--
 package/flann/flann.mk                     |    4 ++--
 package/gpm/gpm.mk                         |    4 ++--
 package/opentyrian-data/opentyrian-data.mk |    4 ++--
 package/opentyrian/opentyrian.mk           |    4 ++--
 package/qhull/qhull.mk                     |    4 ++--
 package/smstools3/smstools3.mk             |    4 ++--
 package/tmux/tmux.mk                       |    4 ++--
 package/yaffs2utils/yaffs2utils.mk         |    4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index bfb138e..ca9c8a7 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # exim
 #
-#############################################################
+################################################################################
 
 EXIM_VERSION = 4.82
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 6f95f19..5b73881 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # flann
 #
-###############################################################################
+################################################################################
 
 FLANN_VERSION = d0c04f4d290ebc3aa9411a3322992d298e51f5aa
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index d927bab..477c54a 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # gpm
 #
-###############################################################################
+################################################################################
 
 GPM_VERSION = 1.20.7
 GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
diff --git a/package/opentyrian-data/opentyrian-data.mk b/package/opentyrian-data/opentyrian-data.mk
index 75fa3d9..30b9002 100644
--- a/package/opentyrian-data/opentyrian-data.mk
+++ b/package/opentyrian-data/opentyrian-data.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # opentyrian-data
 #
-###############################################################################
+################################################################################
 
 OPENTYRIAN_DATA_VERSION = 2.1
 OPENTYRIAN_DATA_SITE = http://www.camanis.net/opentyrian/
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 80465a3..0bdb79b 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # opentyrian
 #
-###############################################################################
+################################################################################
 
 OPENTYRIAN_VERSION = 2.1.20130907
 OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases/
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index f2bc771..15fb46e 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # qhull
 #
-###############################################################################
+################################################################################
 
 QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
 QHULL_SITE = git://gitorious.org/qhull/qhull.git
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index ac293c5..0b38c25 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # smstools3
 #
-###############################################################################
+################################################################################
 
 SMSTOOLS3_VERSION = 3.1.15
 SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages/
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 6288e0b..055e97a 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # tmux
 #
-###############################################################################
+################################################################################
 
 TMUX_VERSION = 1.9a
 TMUX_SITE = http://downloads.sourceforge.net/tmux
diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index ba24958..2f75cb9 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # yaffs2utils
 #
-#############################################################
+################################################################################
 
 YAFFS2UTILS_VERSION = 0.2.9
 YAFFS2UTILS_SOURCE = $(YAFFS2UTILS_VERSION).tar.gz
