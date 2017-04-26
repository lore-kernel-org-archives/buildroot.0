From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:16 +0200
Subject: [Buildroot] [git commit] package/bullet: bump to version 2.86.1
Message-ID: <20170426072113.D9B6080648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a086213b397c59bd4282ce4f002abb6c656bb40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bullet/bullet.hash | 2 +-
 package/bullet/bullet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index cccc425..c6a45c2 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6e157c0b50373bc0e860de27f06397827bb28a4205bc568ae79d76a0f919ed62  bullet-2.85.1.tar.gz
+sha256 c058b2e4321ba6adaa656976c1a138c07b18fc03b29f5b82880d5d8228fbf059  bullet-2.86.1.tar.gz
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 920ea87..3e8fae3 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 2.85.1
+BULLET_VERSION = 2.86.1
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
