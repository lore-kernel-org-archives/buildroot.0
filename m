From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Jun 2013 10:53:32 +0200
Subject: [Buildroot] [git commit] Fix package headers
Message-ID: <20130607090524.E19C99A9FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35c5c6f6c712374bf5ad02152f0eff473e919bb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bonnie/bonnie.mk                  |    2 ++
 package/libroxml/libroxml.mk              |    2 ++
 package/multimedia/gstreamer/gstreamer.mk |    1 -
 toolchain/gcc/gcc-uclibc-4.x.mk           |    4 ++++
 4 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 6d82b8a..a901986 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -1,6 +1,8 @@
+################################################################################
 #
 # bonnie++
 #
+################################################################################
 
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 6e690aa..98b9740 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -1,6 +1,8 @@
+################################################################################
 #
 # libroxml
 #
+################################################################################
 
 LIBROXML_VERSION = 2.2.1
 LIBROXML_SITE = http://libroxml.googlecode.com/files
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 4453fc8..f0fdea4 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -1,4 +1,3 @@
-
 ################################################################################
 #
 # gstreamer
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5be26c4..7ebcbac 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -1,3 +1,5 @@
+################################################################################
+#
 # Makefile for to build a gcc/uClibc toolchain
 #
 # Copyright (C) 2002-2003 Erik Andersen <andersen@uclibc.org>
@@ -16,6 +18,8 @@
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+################################################################################
 
 GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
 
