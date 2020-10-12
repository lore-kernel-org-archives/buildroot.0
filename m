From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:23:13 +0200
Subject: [Buildroot] [git commit] package/zlib-ng: bump to version 1.9.9-b1
Message-ID: <20201012201207.60EC986F34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f7b12a0b4572d7e763c431a63c22cfb912b8b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib-ng/zlib-ng.hash | 4 ++--
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index 1aacecbeac..3e1dba35ba 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	bc95d2a23b572478769b5e12aa2e775df717ba9ff0f44a3a941987c8b997c84a zlib-ng-9609cb56a8f62868ccf264493bc9c3b4d5762fcf.tar.gz
-sha256	d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436 LICENSE.md
+sha256  379723c0c954679a50d1d7df43084e2194dc51ecbc9987c889cb129d1f6734bc  zlib-ng-1.9.9-b1.tar.gz
+sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 1cb00d075b..c56fa72d6f 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 9609cb56a8f62868ccf264493bc9c3b4d5762fcf
+ZLIB_NG_VERSION = 1.9.9-b1
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
