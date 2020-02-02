From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:16 +0100
Subject: [Buildroot] [PATCH 26/32] package/w*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-27-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/w_scan/w_scan.hash     | 3 ++-
 package/weston/weston.hash     | 3 ++-
 package/which/which.hash       | 4 +++-
 package/wipe/wipe.hash         | 1 +
 package/wiringpi/wiringpi.hash | 3 ++-
 package/wmctrl/wmctrl.hash     | 3 ++-
 6 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/w_scan/w_scan.hash b/package/w_scan/w_scan.hash
index e04a084360..fcb0e611bc 100644
--- a/package/w_scan/w_scan.hash
+++ b/package/w_scan/w_scan.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 38e0f38a7bf06cff6d6ea01652ad4ee60da2cb0e937360468f936da785b46ffe  w_scan-20170107.tar.bz2
+sha256  38e0f38a7bf06cff6d6ea01652ad4ee60da2cb0e937360468f936da785b46ffe  w_scan-20170107.tar.bz2
+sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index a2dddf7a5b..408fe5a025 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -4,4 +4,5 @@ sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
 sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
 sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
 # locally computed
-sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
+sha256  0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
+sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/which/which.hash b/package/which/which.hash
index fe649ab019..edea4e5e34 100644
--- a/package/which/which.hash
+++ b/package/which/which.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad	which-2.21.tar.gz
+sha256  f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad  which-2.21.tar.gz
+# Locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wipe/wipe.hash b/package/wipe/wipe.hash
index 9bde2014dd..d607efde44 100644
--- a/package/wipe/wipe.hash
+++ b/package/wipe/wipe.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  463916370f9b35bb34419c2c0ae3dc4c0a471db32e8595afa1d14c0337b61aa0  wipe-2.3.1.tar.bz2
+sha256  890cd89006bb57ce95b460e867c7bcc81d30cbc23067a9be4644bdac6882bc14  LICENSE
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index 9c4fe22f5f..83885e4b6d 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2455fc97d2b60ed169675dccbaabf55e1958c3c2499b246c96edfc8b036e9073 wiringpi-2.46.tar.gz
+sha256  2455fc97d2b60ed169675dccbaabf55e1958c3c2499b246c96edfc8b036e9073  wiringpi-2.46.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
index a08c0e9e04..531f64a0d8 100644
--- a/package/wmctrl/wmctrl.hash
+++ b/package/wmctrl/wmctrl.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9 wmctrl-1.07.tar.gz
+sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.20.1
