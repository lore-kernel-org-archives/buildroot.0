From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:42:16 +0200
Subject: [Buildroot] [git commit branch/next] package/libva: bump version to
 2.4.1
Message-ID: <20190530224415.27DDC8E55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8a37cad6aa78d1b13504e3fee199880e97c3a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 06b7de5762..661eedf16a 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.4.0/libva-2.4.0.tar.bz2.sha1sum
-sha1 2e7b69ebb615d039b9253d4708eeec889b812dbf  libva-2.4.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.4.1/libva-2.4.1.tar.bz2.sha1sum
+sha1 5aeffc9929b4a9a5ebbed94adf065d08fc50bcf9  libva-2.4.1.tar.bz2
 # Locally computed
-sha256 99263056c21593a26f2ece812aee6fe60142b49e6cd46cb33c8dddf18fc19391  libva-2.4.0.tar.bz2
+sha256 e9e053908591b121793eaa5d8aa37675b4cd3af4b12f1f377dff4767f39cee70  libva-2.4.1.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 8a21c11b6c..e876a1a3d0 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.4.0
+LIBVA_VERSION = 2.4.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
