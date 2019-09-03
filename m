From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:41 -0000
Subject: [Buildroot] [git commit] package/argparse: bump to version 0.7
Message-ID: <20190903133620.9AB8C8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e792c74e777f5421638d68454d41acd91fc0b530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this module has moved under the luarocks organization

diff LICENSE:
+                     2019 Paul Ouellette

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/argparse/Config.in     | 2 +-
 package/argparse/argparse.hash | 4 ++--
 package/argparse/argparse.mk   | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/argparse/Config.in b/package/argparse/Config.in
index d207b0482c..d02b191254 100644
--- a/package/argparse/Config.in
+++ b/package/argparse/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ARGPARSE
 	  subcommands and more. Argparse automatically generates
 	  usage, help and error messages.
 
-	  https://github.com/mpeterv/argparse
+	  https://github.com/luarocks/argparse
diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index fa99609cc8..1b01e4b6f9 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 e4029f42d61cbdde1540e0a098a24b1fed0bc8a2803efe2a0d0d3e7f2f2f2c82  argparse-0.6.0-1.src.rock
-sha256 c9b9a9667934d50f028a99b2617469db66663dc3b09d289b82e73e950b2b85eb  argparse/LICENSE
+sha256 47b3ca9e734971ba24ef26b0beff692ce6008f53aaf78c303f3d883648c96acb  argparse-0.7.0-1.src.rock
+sha256 9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.0/LICENSE
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
index 04c46b5279..a9b7a2f719 100644
--- a/package/argparse/argparse.mk
+++ b/package/argparse/argparse.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-ARGPARSE_VERSION = 0.6.0-1
-ARGPARSE_SUBDIR = argparse
+ARGPARSE_VERSION = 0.7.0-1
 ARGPARSE_LICENSE = MIT
 ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
 
