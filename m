From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 22:57:13 +0200
Subject: [Buildroot] [git commit branch/2015.08.x] Update for 2015.08.1
Message-ID: <20150906205829.2820B81D7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e009e7d8615eec10d2c0c2676ef5a276f0a6a5e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2015.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  |    6 ++++++
 Makefile |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 89df9a4..dad9102 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2015.08.1, Released September 6th, 2015
+
+	Fix kernel module infrastructure modules support check
+
+	Updated/fixed packages: eudev
+
 2015.08, Released August 31st, 2015
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 2254a8f..5a87dfa 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.08
+export BR2_VERSION := 2015.08.1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
