From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 21:34:56 +0200
Subject: [Buildroot] [PATCH trivial] package .mk files: use 80 # signs in
	header
Message-ID: <e0ee3818ce568d7d0b28.1398886496@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Kids can't count anymore...

 package/exim/exim.mk                       |  4 ++--
 package/flann/flann.mk                     |  4 ++--
 package/gpm/gpm.mk                         |  4 ++--
 package/opentyrian-data/opentyrian-data.mk |  4 ++--
 package/opentyrian/opentyrian.mk           |  4 ++--
 package/qhull/qhull.mk                     |  4 ++--
 package/smstools3/smstools3.mk             |  4 ++--
 package/tmux/tmux.mk                       |  4 ++--
 package/yaffs2utils/yaffs2utils.mk         |  4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
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
