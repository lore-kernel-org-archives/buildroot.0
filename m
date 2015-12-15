From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:11:23 +0100
Subject: [Buildroot] [git commit] glibmm: bump to version 2.46.3
Message-ID: <20151215211128.9939881DC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e10a981b6c80e8472bb44c24153c5e23cc33b8d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index aeb26bf..c070363 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.2.sha256sum
-sha256	7221a01a768c1cce2bb994cb6ebfe634246dba4788f910484d04e3b0d903a3c8	glibmm-2.46.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.3.sha256sum
+sha256	c78654addeb27a1213bedd7cd21904a45bbb98a5ba2f2f0de2b2f1a5682d86cf	glibmm-2.46.3.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 7f8ee9f..4b6d68f 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM_VERSION_MAJOR = 2.46
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).3
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
