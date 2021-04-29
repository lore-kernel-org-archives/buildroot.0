From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:16:15 +0200
Subject: [Buildroot] [git commit] package/bullet: bump to version 3.09
Message-ID: <20210429084946.B6C60866C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28b4947ed8f53c4edfbf8fef9304dc76480c01ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://github.com/bulletphysics/bullet3/releases/tag/3.09

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bullet/bullet.hash | 2 +-
 package/bullet/bullet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 9da8c733d0..813e8299e1 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 621b36e91c0371933f3c2156db22c083383164881d2a6b84636759dc4cbb0bb8  bullet-2.89.tar.gz
+sha256 f2feef9322329c0571d9066fede2db0ede92b19f7f7fdf54def3b4651f02af03  bullet-3.09.tar.gz
 sha256 885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index b25fc5d219..6ed4da859f 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 2.89
+BULLET_VERSION = 3.09
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
