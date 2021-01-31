From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 22:22:50 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.10
Message-ID: <20210131210253.4798A861C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5d3fc5a53ec4dabfa25e6b7478e8dc9cb0c9588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 4 ++--
 Makefile                 | 4 ++--
 support/misc/Vagrantfile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8f1dc8e295..2236bfb5ef 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2020.02.10, not yet released
+2020.02.10, released January 31st, 2021
 
 	Important / security related fixes.
 
@@ -14,7 +14,7 @@
 	meson: Ensure ccache is not detected and used, as it may
 	conflict with the ccache handling in Buildroot.
 
-	New packages: libnupnp
+	New packages: libnpupnp
 
 	Updated/fixed packages: bctoolbox, brltty, dbus, dovecot,
 	dovecot-pigeonhole, gcc, gerbera, gmrender-resurrect, gst-omx,
diff --git a/Makefile b/Makefile
index 514816978a..0b897a8e44 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.9
+export BR2_VERSION := 2020.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1609088000
+BR2_VERSION_EPOCH = 1612128000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b0c9ade199..e76752e14d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02.9'
+RELEASE='2020.02.10'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
