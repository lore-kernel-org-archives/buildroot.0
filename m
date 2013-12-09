From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2013 09:20:07 +0100
Subject: [Buildroot] [git commit] mention nconfig
Message-ID: <20131209082140.99F739BFA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba39bec809cd74daf93633721d40e4c7a61d1605
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Shawn Landden <shawn@churchofgit.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |    2 +-
 docs/manual/using.txt        |   10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index c7f511a..1290dfc 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -11,7 +11,7 @@ Offline builds
 
 If you intend to do an offline build and just want to download
 all sources that you previously selected in the configurator
-('menuconfig', 'xconfig' or 'gconfig'), then issue:
+('menuconfig', 'nconfig', 'xconfig' or 'gconfig'), then issue:
 
 --------------------
  $ make source
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index de29ad6..9b0a81f 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -15,7 +15,13 @@ assistant:
  $ make menuconfig
 --------------------
 
-to run the curses-based configurator, or
+or
+
+--------------------
+ $ make nconfig
+--------------------
+
+to run the old or new curses-based configurator, or
 
 --------------------
  $ make xconfig
@@ -105,7 +111,7 @@ This directory contains several subdirectories:
 * +toolchain/+ contains the build directories for the various
   components of the cross-compilation toolchain.
 
-These commands, +make menuconfig|gconfig|xconfig+ and +make+, are the
+These commands, +make menuconfig|nconfig|gconfig|xconfig+ and +make+, are the
 basic ones that allow to easily and quickly generate images fitting
 your needs, with all the supports and applications you enabled.
 
