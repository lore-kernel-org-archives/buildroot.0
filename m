From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 21:22:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/lockfile-progs: bump to version
 0.1.18
Message-ID: <20190921192243.21450-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lockfile-progs/lockfile-progs.hash | 7 +++++--
 package/lockfile-progs/lockfile-progs.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.hash b/package/lockfile-progs/lockfile-progs.hash
index e628f0cc1e..fc3d4b68bc 100644
--- a/package/lockfile-progs/lockfile-progs.hash
+++ b/package/lockfile-progs/lockfile-progs.hash
@@ -1,2 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.17.dsc
-sha256	03fb05d25499532f497775b1747b61fa6beebf12d3bcc951e125349ae166c511	lockfile-progs_0.1.17.tar.gz
+# From https://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.18.tar.gz
+sha256	a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6	lockfile-progs_0.1.18.tar.gz
+
+# Hash for license file
+sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index ed192f1028..9704fa5235 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LOCKFILE_PROGS_VERSION = 0.1.17
+LOCKFILE_PROGS_VERSION = 0.1.18
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockfile-progs
+LOCKFILE_PROGS_SITE = https://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPL-2.0
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
-- 
2.23.0
