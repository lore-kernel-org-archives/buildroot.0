From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 23:42:21 +0100
Subject: [Buildroot] [git commit] package/minizip: bump to version 2.9.0
Message-ID: <20191029223551.6C82F8D682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=989125190d82f84fe93db16dfb2ad705be077e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash, minor EOL/EOF fix:
https://github.com/nmoinvaz/minizip/commit/8f397f826d0227172c2f8da1c7e297a527862a20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/minizip/minizip.hash | 4 ++--
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index d9473581c1..1b4f32a966 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b01607d219ed40d817404947dd5339d64242a083df6372c37b0387b5501d84f5  minizip-2.8.2.tar.gz
-sha256 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  LICENSE
+sha256 d9501b1048064855222a42264ce773eebc29bbad5bcadbbeb22db2c3e65ae447  minizip-2.9.0.tar.gz
+sha256 675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index a9eea1b1c8..bf0b6198b0 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.8.2
+MINIZIP_VERSION = 2.9.0
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = \
 	host-pkgconf \
