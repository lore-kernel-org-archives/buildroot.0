From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:33 -0000
Subject: [Buildroot] [git commit] package/cage: bump to version 0.1.2.1
Message-ID: <20200902161634.2B6F985EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22c7cfc3580d78d8381be5f1724806cbc3cc402e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

requires at least wlroots 0.11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 3177474960..5cae952d72 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Generated locally
-sha256 2f9bc2bd3c61cddb0d3b406754c4906eabf5a5d1aade26eb361dffccff2601e3  cage-6eb693c05b5b34d4ed5ad8234a9f79a14ac8e07d.tar.gz
+sha256 38a3e3968f00cc58fe1d9448e972cfac7d1efa30c48699f09032f264101a55ac  cage-0.1.2.1.tar.gz
 
 # Hashes for license files:
 sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 3d259912cc..9fc01d36c1 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CAGE_VERSION = 6eb693c05b5b34d4ed5ad8234a9f79a14ac8e07d
-CAGE_SITE = $(call github,Hjdskes,cage,$(CAGE_VERSION))
+CAGE_VERSION = 0.1.2.1
+CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
