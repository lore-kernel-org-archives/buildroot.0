From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 15 Jul 2020 20:35:24 -0300
Subject: [Buildroot] [PATCH] package/xterm: bump version to 358
Message-ID: <20200715233525.11935-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Separate the fields in the hash file by two spaces.

Change the hash of the license:
- Copyright message changed from 2018,2019 to 2019,2020

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 57d5a72b9a1b..7f2ff2c301ed 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 39a6a3d3724f9a0a068f8cc353ab0c82831f0a43abb24470d933af299658475f xterm-349.tgz
+sha256  7cdb106962910a99700b3c45fa1a1493e46e97a5aa3785093a786e07196fbf7b  xterm-358.tgz
 # Locally calculated
-sha256 b0d302c6d67f63122bbe8d622dd8a66cfadccc32853f606b7558103609201993 COPYING
+sha256  c655a5fa3dec936543e02f863b8c1343d08522a2821cb484df6c5f62afa7354d  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 8cbfa070e2ec..5e3e64fff4de 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 349
+XTERM_VERSION = 358
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.17.1
