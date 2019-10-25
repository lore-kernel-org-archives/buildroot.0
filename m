From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Oct 2019 19:10:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 1.11.13
Message-ID: <20191025171051.4439-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hwloc/hwloc.hash | 7 ++++---
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index c523bc5376..9637ba1325 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,6 @@
 # From https://www.open-mpi.org/software/hwloc/v1.11/
-md5 13d2e4dbce392cda41f1451d386d9a45  hwloc-1.11.7.tar.bz2
-sha1 7b78850b8504a93972a3f114a0e75f9b115607d9  hwloc-1.11.7.tar.bz2
+md5 3c792e23c209e9e1bafe9bdbc613d401  hwloc-1.11.13.tar.bz2
+sha1 c3ae96a845ff3800f28b28fdb48146f971589653  hwloc-1.11.13.tar.bz2
 # Locally computed
-sha256 ab6910e248eed8c85d08b529917a6aae706b32b346e886ba830895e36a809729  hwloc-1.11.7.tar.bz2
+sha256 a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8  hwloc-1.11.13.tar.bz2
+sha256 c1816ed2da6aea779c4f27352f807c8bbaf545c2843d7b2ae818e1d529028821  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 598a9c6e70..81cb89e35b 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HWLOC_VERSION_MAJOR = 1.11
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).7
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).13
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/downloads
 HWLOC_LICENSE = BSD-3-Clause
-- 
2.23.0
