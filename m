From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:18:08 +0200
Subject: [Buildroot] [git commit] glibmm: bump to version 2.52.0
Message-ID: <20170902211053.2FE14819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d540668b5ca0ae0b8dd24c4ee0d3e7ae31c10f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index fbcf855..e1b379f 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.50/glibmm-2.50.0.sha256sum
-sha256	df726e3c6ef42b7621474b03b644a2e40ec4eef94a1c5a932c1e740a78f95e94	glibmm-2.50.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.52/glibmm-2.52.0.sha256sum
+sha256	81b8abf21c645868c06779abc5f34efc1a51d5e61589dab2a2ed67faa8d4811e glibmm-2.52.0.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 030ef1e..303eac6 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.50
+GLIBMM_VERSION_MAJOR = 2.52
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
