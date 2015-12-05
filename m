From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 23:05:32 +0100
Subject: [Buildroot] [git commit branch/2015.11.x] Update for 2015.11.1
Message-ID: <20151205220550.8936380AD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f0610c188007ee481508d453b062d77614c153d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2015.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 10 ++++++++++
 Makefile |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 336b195..7b7797c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2015.11.1, Released December 5th, 2015
+
+	Fix for issue with the host package RPATH check when a custom host
+	directory (BR2_HOST_DIR=/path/to/somewhere) is used.
+
+	Important (and/or security related) bugfixes for busybox,
+	dropbear, libpng and openssl.
+
+	Updated/fixed packages: busybox, dropbear, gawk, libpng, openssl
+
 2015.11, Released November 30th, 2015
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index b345471..ec7dccb 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11
+export BR2_VERSION := 2015.11.1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
