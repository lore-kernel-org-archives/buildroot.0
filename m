From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 22:07:18 +0200
Subject: [Buildroot] [git commit] package/cramfs: bump to version 2.1
Message-ID: <20200725200302.0437C821EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bd98ce6eebaca271cb9fa32ce2ee100ce297976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cramfs/cramfs.hash | 2 +-
 package/cramfs/cramfs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cramfs/cramfs.hash b/package/cramfs/cramfs.hash
index af7d2e1db3..672266b468 100644
--- a/package/cramfs/cramfs.hash
+++ b/package/cramfs/cramfs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  99d87aa5874f4a34c219275e0297b0f4c710895f9c87295267aeabe6a752add1  cramfs-1a1e65f2a049.tar.gz
+sha256  cdb7a4ecad034f063b6456b37cdf653ae31758a224c32161e54712a9d7f01cc3  cramfs-2.1.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 18bef80bd2..85706d1a8e 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRAMFS_VERSION = 1a1e65f2a049
-CRAMFS_SITE = $(call github,npitre,cramfs-tools,$(CRAMFS_VERSION))
+CRAMFS_VERSION = 2.1
+CRAMFS_SITE = $(call github,npitre,cramfs-tools,v$(CRAMFS_VERSION))
 CRAMFS_LICENSE = GPL-2.0+
 CRAMFS_LICENSE_FILES = COPYING
 
