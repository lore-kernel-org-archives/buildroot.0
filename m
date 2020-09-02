From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:13 +0200
Subject: [Buildroot] [PATCH 1/6] package/argparse: bump to version 0.7.1
Message-ID: <20200902150818.874743-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/argparse.hash | 4 ++--
 package/argparse/argparse.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index 1b01e4b6f..fd7c48eab 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 47b3ca9e734971ba24ef26b0beff692ce6008f53aaf78c303f3d883648c96acb  argparse-0.7.0-1.src.rock
-sha256 9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.0/LICENSE
+sha256 ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
+sha256 9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
index a9b7a2f71..d719e67d8 100644
--- a/package/argparse/argparse.mk
+++ b/package/argparse/argparse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARGPARSE_VERSION = 0.7.0-1
+ARGPARSE_VERSION = 0.7.1-1
 ARGPARSE_LICENSE = MIT
 ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
 
-- 
2.25.1
