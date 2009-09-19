From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 21:37:25 +0200
Subject: [Buildroot] [git commit master] target: update default /etc/issue
	and /etc/hostname
Message-ID: <20090919194020.6B60677781@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c050a7fe567c94856cf975258983882110b9aa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust default /etc/issue to print 'Welcome to Buildroot' like the
recently removed BR2_BANNER did, and adjust default hostname to be
'buildroot' instead of uclibc as we now support external glibc
toolchains as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../root/target_busybox_skeleton/etc/hostname      |    2 +-
 .../Atmel/root/target_busybox_skeleton/etc/issue   |    3 +--
 .../device/Atmel/root/target_skeleton/etc/hostname |    2 +-
 target/device/Atmel/root/target_skeleton/etc/issue |    3 +--
 .../generic/target_busybox_skeleton/etc/hostname   |    2 +-
 target/generic/target_busybox_skeleton/etc/issue   |    3 +--
 target/generic/target_skeleton/etc/hostname        |    2 +-
 target/generic/target_skeleton/etc/issue           |    3 +--
 8 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/hostname b/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
index 52e67d6..5b26b35 100644
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
+++ b/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
@@ -1 +1 @@
-uclibc
+buildroot
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/issue b/target/device/Atmel/root/target_busybox_skeleton/etc/issue
index f24b862..90f1779 100644
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/issue
+++ b/target/device/Atmel/root/target_busybox_skeleton/etc/issue
@@ -1,4 +1,3 @@
 
-
-Welcome to the Erik's uClibc development environment.
+Welcome to Buildroot
 
diff --git a/target/device/Atmel/root/target_skeleton/etc/hostname b/target/device/Atmel/root/target_skeleton/etc/hostname
index 52e67d6..5b26b35 100644
--- a/target/device/Atmel/root/target_skeleton/etc/hostname
+++ b/target/device/Atmel/root/target_skeleton/etc/hostname
@@ -1 +1 @@
-uclibc
+buildroot
diff --git a/target/device/Atmel/root/target_skeleton/etc/issue b/target/device/Atmel/root/target_skeleton/etc/issue
index f24b862..90f1779 100644
--- a/target/device/Atmel/root/target_skeleton/etc/issue
+++ b/target/device/Atmel/root/target_skeleton/etc/issue
@@ -1,4 +1,3 @@
 
-
-Welcome to the Erik's uClibc development environment.
+Welcome to Buildroot
 
diff --git a/target/generic/target_busybox_skeleton/etc/hostname b/target/generic/target_busybox_skeleton/etc/hostname
index 52e67d6..5b26b35 100644
--- a/target/generic/target_busybox_skeleton/etc/hostname
+++ b/target/generic/target_busybox_skeleton/etc/hostname
@@ -1 +1 @@
-uclibc
+buildroot
diff --git a/target/generic/target_busybox_skeleton/etc/issue b/target/generic/target_busybox_skeleton/etc/issue
index f24b862..90f1779 100644
--- a/target/generic/target_busybox_skeleton/etc/issue
+++ b/target/generic/target_busybox_skeleton/etc/issue
@@ -1,4 +1,3 @@
 
-
-Welcome to the Erik's uClibc development environment.
+Welcome to Buildroot
 
diff --git a/target/generic/target_skeleton/etc/hostname b/target/generic/target_skeleton/etc/hostname
index 52e67d6..5b26b35 100644
--- a/target/generic/target_skeleton/etc/hostname
+++ b/target/generic/target_skeleton/etc/hostname
@@ -1 +1 @@
-uclibc
+buildroot
diff --git a/target/generic/target_skeleton/etc/issue b/target/generic/target_skeleton/etc/issue
index f24b862..90f1779 100644
--- a/target/generic/target_skeleton/etc/issue
+++ b/target/generic/target_skeleton/etc/issue
@@ -1,4 +1,3 @@
 
-
-Welcome to the Erik's uClibc development environment.
+Welcome to Buildroot
 
-- 
1.6.3.3
