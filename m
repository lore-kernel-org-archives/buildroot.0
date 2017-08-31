From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 31 Aug 2017 11:15:05 -0400
Subject: [Buildroot] [PATCH 1/1] glibmm: bump to version 2.52.0
Message-ID: <20170831151505.26107-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index fbcf85564..e1b379fa0 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.50/glibmm-2.50.0.sha256sum
-sha256	df726e3c6ef42b7621474b03b644a2e40ec4eef94a1c5a932c1e740a78f95e94	glibmm-2.50.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.52/glibmm-2.52.0.sha256sum
+sha256	81b8abf21c645868c06779abc5f34efc1a51d5e61589dab2a2ed67faa8d4811e glibmm-2.52.0.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 030ef1e68..303eac650 100644
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
-- 
2.13.5
