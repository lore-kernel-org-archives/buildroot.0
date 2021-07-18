From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:36:08 +0200
Subject: [Buildroot] [git commit] package/civetweb: bump to version 1.14
Message-ID: <20210718100226.716EE85FBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.14:

https://github.com/civetweb/civetweb/releases/tag/v1.14

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/civetweb/civetweb.hash | 2 +-
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index cf9d676832..96e4aa105b 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7ccc76c2f1b5f4e8d855eb328ed542f8fe3b882a6da868781799a98f4acdedc  civetweb-1.13.tar.gz
+sha256  d02d7ab091c8b4edf21fc13a03c6db08a8a8b8605e35e0073251b9d88443c653  civetweb-1.14.tar.gz
 sha256  291622dfbbf4fb35829726fbe97177b7227c0d4d6392b350660af73af4f86df8  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 94fbb4f9d8..40841285ef 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.13
+CIVETWEB_VERSION = 1.14
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
