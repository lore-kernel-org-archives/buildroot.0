From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Fri,  8 Dec 2017 20:39:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: change tarball compression to
 xz
Message-ID: <1512761941-6815-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index d961083..41f51b1 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 1c853bc960dff0a0e51e3e28bc4a4a8165b58b41bb64ea3abb90f254d9947a8c  exim-4.89.1.tar.bz2
+# Locally calculated after checking pgp signature
+sha256 1a21322a10e2da9c0bd6a2a483b6e7ef8fa7f16efcab4c450fd73e7188f5fa94  exim-4.89.1.tar.xz
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 612eaf4..37eab50 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EXIM_VERSION = 4.89.1
-EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
+EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
-- 
1.9.1
