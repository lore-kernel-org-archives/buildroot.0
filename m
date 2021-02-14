From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:53:18 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/xterm: bump
 version to 358
Message-ID: <20210214163455.A4A7580057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dba7f4612f50a78d1713f6f9cdf85c3c0898ea28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Separate the fields in the hash file by two spaces.

Change the hash of the license:
- Copyright message changed from 2018,2019 to 2019,2020

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 650f0aa3e27e4c950fa9216d806fc39cdf11eada)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 57d5a72b9a..7f2ff2c301 100644
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
index 8cbfa070e2..5e3e64fff4 100644
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
