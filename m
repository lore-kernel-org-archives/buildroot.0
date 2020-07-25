From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Jul 2020 00:12:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: bump to version
 3.0.1
Message-ID: <20200725221201.1064330-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/chocolate-doom/chocolate-doom.hash | 4 ++--
 package/chocolate-doom/chocolate-doom.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
index 7f7fa27ab7..79eb1c6a3f 100644
--- a/package/chocolate-doom/chocolate-doom.hash
+++ b/package/chocolate-doom/chocolate-doom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	73aea623930c7d18a7a778eea391e1ddfbe90ad1ac40a91b380afca4b0e1dab8	chocolate-doom-3.0.0.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  d435d6177423491d60be706da9f07d3ab4fabf3e077ec2a3fc216e394fcfc8c7  chocolate-doom-3.0.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 4e0a8fee18..8318c123bd 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHOCOLATE_DOOM_VERSION = 3.0.0
+CHOCOLATE_DOOM_VERSION = 3.0.1
 CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
 CHOCOLATE_DOOM_LICENSE = GPL-2.0+
 CHOCOLATE_DOOM_LICENSE_FILES = COPYING
-- 
2.27.0
