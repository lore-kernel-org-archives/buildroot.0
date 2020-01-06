From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Jan 2020 22:48:55 +0100
Subject: [Buildroot] [PATCH] package/bullet: bump to version 2.89
Message-ID: <20200106214855.126216-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/bulletphysics/bullet3/releases/tag/2.89

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/bullet/bullet.hash | 2 +-
 package/bullet/bullet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 2b0b974cd2..9da8c733d0 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 21c135775527754fc2929db1db5144e92ad0218ae72840a9f162acb467a7bbf9  bullet-2.88.tar.gz
+sha256 621b36e91c0371933f3c2156db22c083383164881d2a6b84636759dc4cbb0bb8  bullet-2.89.tar.gz
 sha256 885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index f343213702..b25fc5d219 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 2.88
+BULLET_VERSION = 2.89
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
-- 
2.24.1
