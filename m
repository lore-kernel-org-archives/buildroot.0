From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Nov 2015 09:28:56 +0100
Subject: [Buildroot] [git commit] glibmm: bump to version 2.46.2
Message-ID: <20151201232119.6766F82210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64f36309605445dfe01ed644897223d78f470380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 9a7a6c8..aeb26bf 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.1.sha256sum
-sha256	9647e596c1081d2ea202bd3da2824ec2ea359498fa86eb59a55b1b307dd8c4aa	glibmm-2.46.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.2.sha256sum
+sha256	7221a01a768c1cce2bb994cb6ebfe634246dba4788f910484d04e3b0d903a3c8	glibmm-2.46.2.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 66b357d..7f8ee9f 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM_VERSION_MAJOR = 2.46
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
