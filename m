From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Jun 2021 08:07:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/libva: bump version to 2.12.0
In-Reply-To: <20210625060725.449924-1-bernd.kuhls@t-online.de>
References: <20210625060725.449924-1-bernd.kuhls@t-online.de>
Message-ID: <20210625060725.449924-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://github.com/intel/libva/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 60ab284d86..b6531b2c57 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.11.0/libva-2.11.0.tar.bz2.sha1sum
-sha1  35baa7667e8a51ca3d481786095469d38cacfb2f  libva-2.11.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.12.0/libva-2.12.0.tar.bz2.sha1sum
+sha1  9704197d1d909d727f2e180672d287070576a923  libva-2.12.0.tar.bz2
 # Locally computed
-sha256  6e361117038b571ad4741d38c9280db8c140b17e76e8c01fc7a4d608d3ed7d5d  libva-2.11.0.tar.bz2
+sha256  d3f4873715077a8c969c9bfe4ba8455a133353176be0ffe0c41ffd4155c9a8c8  libva-2.12.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f24a504445..70cf4fee91 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.11.0
+LIBVA_VERSION = 2.12.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.30.2
