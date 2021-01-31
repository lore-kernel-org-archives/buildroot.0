From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 21:34:30 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] Update for 2020.11.2
Message-ID: <20210131201523.C43B481503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=551cb630079316efe928d7c2eb0358a19e38fc48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 2 +-
 Makefile                 | 4 ++--
 support/misc/Vagrantfile | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 731d3f61c7..7e1e5a58ce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2020.11.2, not yet released
+2020.11.2, released January 31st, 2021
 
 	Important / security related fixes.
 
diff --git a/Makefile b/Makefile
index 06f1ef6aea..293b5880f5 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11.1
+export BR2_VERSION := 2020.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1609079000
+BR2_VERSION_EPOCH = 1612125000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 753a9bdcdc..ed12abd2f0 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.1'
+RELEASE='2020.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
