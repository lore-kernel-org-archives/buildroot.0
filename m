From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2020 22:26:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtdev: bump to version 1.1.6
Message-ID: <20200410202621.650851-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation of hash file (two spaces)
- This bump will fix build with musl 1.2.0

Fixes:
 - http://autobuild.buildroot.org/results/5861dc032ba2d0e092f742674759b39f393a710d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtdev/mtdev.hash | 4 ++--
 package/mtdev/mtdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtdev/mtdev.hash b/package/mtdev/mtdev.hash
index 7ead723ef4..355e50ff6f 100644
--- a/package/mtdev/mtdev.hash
+++ b/package/mtdev/mtdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f  mtdev-1.1.5.tar.bz2
-sha256 795bfe74daae59a97d3a0c8ec0ba0f08c243adf94a3aa7981a4136fce31d55b4  COPYING
+sha256  15d7b28da8ac71d8bc8c9287c2045fd174267bc740bec10cfda332dc1204e0e0  mtdev-1.1.6.tar.bz2
+sha256  795bfe74daae59a97d3a0c8ec0ba0f08c243adf94a3aa7981a4136fce31d55b4  COPYING
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index f4c38d5c41..7191858187 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV_VERSION = 1.1.5
+MTDEV_VERSION = 1.1.6
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev
 
-- 
2.25.1
