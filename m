From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 11:07:25 +0200
Subject: [Buildroot] [git commit] package/gdbm: bump version to 1.18.1
Message-ID: <20190804090540.DC051806AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64d14df95c97d2c2dd5e8999010e99d3cf62b47b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdbm/gdbm.hash | 9 +++++----
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index cab712e17e..8de9f6368d 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,5 +1,6 @@
-# From http://www.gnu.org.ua/software/gdbm/download.html
-md5 8929dcda2a8de3fd2367bdbf66769376  gdbm-1.13.tar.gz
-sha1 7f2a8301497bbcac91808b011ca533380914fd21  gdbm-1.13.tar.gz
+# From https://lists.gnu.org/archive/html/info-gnu/2018-10/msg00006.html
+md5 988dc82182121c7570e0cb8b4fcd5415  gdbm-1.18.1.tar.gz
+sha1 4a923ebfac06bb05c1c7699b206719e06a938f0d  gdbm-1.18.1.tar.gz
 # Locally computed
-sha256 9d252cbd7d793f7b12bcceaddda98d257c14f4d1890d851c386c37207000a253  gdbm-1.13.tar.gz
+sha256 86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc  gdbm-1.18.1.tar.gz
+sha256 690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index acd8cd2ac2..084a7769f2 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.13
+GDBM_VERSION = 1.18.1
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
