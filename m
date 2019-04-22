From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 22 Apr 2019 23:08:47 +0200
Subject: [Buildroot] [PATCH] package/bullet: bump to verion 2.88
Message-ID: <20190422210847.31404-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

See release notes:
https://github.com/bulletphysics/bullet3/releases/tag/2.88

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/bullet/bullet.hash | 3 ++-
 package/bullet/bullet.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index c6a45c2ac3..2b0b974cd2 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c058b2e4321ba6adaa656976c1a138c07b18fc03b29f5b82880d5d8228fbf059  bullet-2.86.1.tar.gz
+sha256 21c135775527754fc2929db1db5144e92ad0218ae72840a9f162acb467a7bbf9  bullet-2.88.tar.gz
+sha256 885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 3e8fae3a06..1345f3747e 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 2.86.1
+BULLET_VERSION = 2.88
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
-- 
2.14.5
