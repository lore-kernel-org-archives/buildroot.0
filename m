From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 15:19:07 +0100
Subject: [Buildroot] [git commit] package/memtool: bump to version 2018.03.0
Message-ID: <20191214141656.5F73187F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc161e816f8e769b9569dc4aa1ff0364b2ca178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/memtool/memtool.hash | 3 ++-
 package/memtool/memtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/memtool/memtool.hash b/package/memtool/memtool.hash
index 95df1aaf85..da4880bd35 100644
--- a/package/memtool/memtool.hash
+++ b/package/memtool/memtool.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  58309d356cb9b45a241cb602ca3850891a70ddaa93ced51d1cced78e14767680  memtool-2016.10.0.tar.xz
+sha256  87cb7175266ff3a00a9c1f541c4c6c93693ffbe8dcc0d97a60d13c45ff860900  memtool-2018.03.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/memtool/memtool.mk b/package/memtool/memtool.mk
index c236cab8ba..75e378311a 100644
--- a/package/memtool/memtool.mk
+++ b/package/memtool/memtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTOOL_VERSION = 2016.10.0
+MEMTOOL_VERSION = 2018.03.0
 MEMTOOL_SITE = http://public.pengutronix.de/software/memtool
 MEMTOOL_SOURCE = memtool-$(MEMTOOL_VERSION).tar.xz
 MEMTOOL_LICENSE = GPL-2.0
