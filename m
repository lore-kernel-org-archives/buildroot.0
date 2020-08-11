From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Aug 2020 11:49:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/fping: bump to version 5.0
Message-ID: <20200811094920.1857292-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump will fix a build failure with gcc 10 thanks to
https://github.com/schweikert/fping/commit/0ed73181eb54e3f2dc744271c0329620972a85ab

Also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/f5c8e546200594e2367444e93e31aa615bd73796

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fping/fping.hash | 4 ++--
 package/fping/fping.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 0aa0330b5a..0b2233f379 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 7d339674b6a95aae1d8ad487ff5056fd95b474c3650938268f6a905c3771b64a  fping-4.2.tar.gz
+sha256  ed38c0b9b64686a05d1b3bc1d66066114a492e04e44eef1821d43b1263cd57b8  fping-5.0.tar.gz
 
 # Hash for license file
-sha256 6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
+sha256  6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 5d3ad59e56..24aca32367 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 4.2
+FPING_VERSION = 5.0
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.27.0
