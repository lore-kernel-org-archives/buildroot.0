From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 10 Jan 2020 23:23:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/scons: bump to version 3.1.2
Message-ID: <20200110222355.153442-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/scons/scons.hash | 2 +-
 package/scons/scons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 14be1250de..bbeda86b11 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f  scons-3.1.0.tar.gz
+sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
 sha256  c4248451b6a4cd09870de4fb82a857feb9f98174167b07500c19ed0263fd4db7  LICENSE.txt
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index d7cc427add..da2ccceb08 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.1.0
+SCONS_VERSION = 3.1.2
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
-- 
2.24.1
