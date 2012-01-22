From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 22:53:19 +0100
Subject: [Buildroot] [git commit] ctng: use 3.0.4 kernel headers
Message-ID: <20120122215543.1649C90358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd3015c7e20889e9c81c1e893620c8eef8347f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng.config-eglibc                     |    6 +++---
 .../crosstool-ng.config-glibc                      |    6 +++---
 .../crosstool-ng.config-uClibc                     |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 682afb1..ffe85df 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -168,15 +168,15 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.39.4"
+CT_KERNEL_VERSION="3.0.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_V_3_0_4 is not set
+CT_KERNEL_V_3_0_4=y
 # CT_KERNEL_V_3_0_3 is not set
 # CT_KERNEL_V_3_0_2 is not set
 # CT_KERNEL_V_3_0_1 is not set
 # CT_KERNEL_V_3_0 is not set
-CT_KERNEL_V_2_6_39_4=y
+# CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 8fb90b8..35c464a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -168,15 +168,15 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.39.4"
+CT_KERNEL_VERSION="3.0.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_V_3_0_4 is not set
+CT_KERNEL_V_3_0_4=y
 # CT_KERNEL_V_3_0_3 is not set
 # CT_KERNEL_V_3_0_2 is not set
 # CT_KERNEL_V_3_0_1 is not set
 # CT_KERNEL_V_3_0 is not set
-CT_KERNEL_V_2_6_39_4=y
+# CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 50603c6..dcc0527 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -168,16 +168,16 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.38.8"
+CT_KERNEL_VERSION="3.0.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_V_3_0_4 is not set
+CT_KERNEL_V_3_0_4=y
 # CT_KERNEL_V_3_0_3 is not set
 # CT_KERNEL_V_3_0_2 is not set
 # CT_KERNEL_V_3_0_1 is not set
 # CT_KERNEL_V_3_0 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
-CT_KERNEL_V_2_6_38_8=y
+# CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
 # CT_KERNEL_V_2_6_35_14 is not set
