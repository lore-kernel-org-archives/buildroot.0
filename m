From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 22:21:59 +0200
Subject: [Buildroot] [git commit master 1/1] Atmel/atstk100*: make /etc/mtab
	a symlink to /proc/mounts
Message-ID: <20100718202311.9840082B7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58ddb37e216ae1545e9933a51e90a3fdeb10a5c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2233

To match the other skeletons.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 mode change 100644 => 120000 target/device/Atmel/atstk1005/target_skeleton/etc/mtab
 mode change 100644 => 120000 target/device/Atmel/atstk100x/target_skeleton/etc/mtab

diff --git a/CHANGES b/CHANGES
index f752f52..db8bf16 100644
--- a/CHANGES
+++ b/CHANGES
@@ -65,6 +65,7 @@
 	#2167: Bump busybox to 1.17.0, convert to gentargets, drop 1.12, ...
 	#2191: linux-fusion build fail
 	#2221: Qt does not compile (dependencies not taken into account?)
+	#2233: Atmel atstk target skeletons have /etc/mtab as a file, not ...
 
 2010.05, Released May 30th, 2010:
 
diff --git a/target/device/Atmel/atstk1005/target_skeleton/etc/mtab b/target/device/Atmel/atstk1005/target_skeleton/etc/mtab
deleted file mode 100644
index e1c2045..0000000
--- a/target/device/Atmel/atstk1005/target_skeleton/etc/mtab
+++ /dev/null
@@ -1 +0,0 @@
-../proc/mounts
\ No newline at end of file
diff --git a/target/device/Atmel/atstk1005/target_skeleton/etc/mtab b/target/device/Atmel/atstk1005/target_skeleton/etc/mtab
new file mode 120000
index 0000000..e1c2045
--- /dev/null
+++ b/target/device/Atmel/atstk1005/target_skeleton/etc/mtab
@@ -0,0 +1 @@
+../proc/mounts
\ No newline at end of file
diff --git a/target/device/Atmel/atstk100x/target_skeleton/etc/mtab b/target/device/Atmel/atstk100x/target_skeleton/etc/mtab
deleted file mode 100644
index e1c2045..0000000
--- a/target/device/Atmel/atstk100x/target_skeleton/etc/mtab
+++ /dev/null
@@ -1 +0,0 @@
-../proc/mounts
\ No newline at end of file
diff --git a/target/device/Atmel/atstk100x/target_skeleton/etc/mtab b/target/device/Atmel/atstk100x/target_skeleton/etc/mtab
new file mode 120000
index 0000000..e1c2045
--- /dev/null
+++ b/target/device/Atmel/atstk100x/target_skeleton/etc/mtab
@@ -0,0 +1 @@
+../proc/mounts
\ No newline at end of file
-- 
1.7.1
