From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:16 +0200
Subject: [Buildroot] [git commit] libcroco: bump to version 0.6.12
Message-ID: <20170426072113.B588C80648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7daae8362be2060527fe1429fa640c325b477d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcroco/libcroco.hash | 4 ++--
 package/libcroco/libcroco.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
index edf0b1f..83d2ffe 100644
--- a/package/libcroco/libcroco.hash
+++ b/package/libcroco/libcroco.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.11.sha256sum
-sha256	132b528a948586b0dfa05d7e9e059901bca5a3be675b6071a90a90b81ae5a056	libcroco-0.6.11.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.12.sha256sum
+sha256	ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860	libcroco-0.6.12.tar.xz
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 5ea0b77..612fd1f 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCROCO_VERSION_MAJOR = 0.6
-LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).11
+LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).12
 LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSION_MAJOR)
 LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
 LIBCROCO_INSTALL_STAGING = YES
