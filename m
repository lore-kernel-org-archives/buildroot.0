From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Nov 2019 19:07:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.3.4
Message-ID: <20191117180753.7394-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with libupnp 1.8.5 through
https://github.com/gerbera/gerbera/commit/1476d7a90673a870091044fcc0307f5bcaeb24be

Fixes:
 - http://autobuild.buildroot.org/results/e77839fad16caa5798cacb36a5a48b3dbb822ea6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 05085b3279..533a903882 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	47515d5d9b640c31d114c74aa5532c3d6f40d6a8a60b00f1cb1cef7629d8d9db	gerbera-1.3.2.tar.gz
+sha256	c7fbb6104dd03ed22d114c7b1fbe95eb7f90893148630e16b0a4c23f1f631341	gerbera-1.3.4.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index a177a73107..2579b8f2e4 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.3.2
+GERBERA_VERSION = 1.3.4
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.24.0
