From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:16:17 +0200
Subject: [Buildroot] [git commit] libnfc: Bump version and change site
Message-ID: <20150726212545.A6F427F95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5321e3d230992e467fcaf327f628d13354d757
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is a closing forge, libnfc has already made the move to
Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfc/libnfc.hash |    2 ++
 package/libnfc/libnfc.mk   |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libnfc/libnfc.hash b/package/libnfc/libnfc.hash
new file mode 100644
index 0000000..307e049
--- /dev/null
+++ b/package/libnfc/libnfc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072  libnfc-1.7.1.tar.bz2
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index ff55f93..aceedb0 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNFC_VERSION = 7b7f5061427b5456835dd48923a8cc0563cfd1e9
-LIBNFC_SITE = http://libnfc.googlecode.com/git
-LIBNFC_SITE_METHOD = git
+LIBNFC_VERSION = 1.7.1
+LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.bz2
+LIBNFC_SITE = https://github.com/nfc-tools/libnfc/releases/download/libnfc-$(LIBNFC_VERSION)
 LIBNFC_LICENSE = LGPLv3+
 LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
