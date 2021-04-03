From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:49:53 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 2.11.0
Message-ID: <20210403132549.A021D8A3C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=845182fa733377f572b911741cd62b6a0fe8d3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/intel/libva/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 80f7d3c066..60ab284d86 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.10.0/libva-2.10.0.tar.bz2.sha1sum
-sha1  c33459efcab503eea89379bb627ef8a8f497b5b4  libva-2.10.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.11.0/libva-2.11.0.tar.bz2.sha1sum
+sha1  35baa7667e8a51ca3d481786095469d38cacfb2f  libva-2.11.0.tar.bz2
 # Locally computed
-sha256  fa81e35b50d9818fce5ec9eeeeff08a24a8864ceeb9a5c8e7ae4446eacfc0236  libva-2.10.0.tar.bz2
+sha256  6e361117038b571ad4741d38c9280db8c140b17e76e8c01fc7a4d608d3ed7d5d  libva-2.11.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 0ec6b12868..f24a504445 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.10.0
+LIBVA_VERSION = 2.11.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
