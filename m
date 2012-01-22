From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 22:54:58 +0100
Subject: [Buildroot] [git commit] ctng: use gcc 4.4.6
Message-ID: <20120122215543.25CE89035B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c8747d2c426323aabbbe07a34b2796bdfb68ca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng.config-eglibc                     |    6 +++---
 .../crosstool-ng.config-glibc                      |    6 +++---
 .../crosstool-ng.config-uClibc                     |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index ffe85df..c1ab679 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -230,12 +230,12 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.3"
+CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
-# CT_CC_V_4_4_6 is not set
+CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
-CT_CC_V_4_4_3=y
+# CT_CC_V_4_4_3 is not set
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 35c464a..4a555c7 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -230,12 +230,12 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.3"
+CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
-# CT_CC_V_4_4_6 is not set
+CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
-CT_CC_V_4_4_3=y
+# CT_CC_V_4_4_3 is not set
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index dcc0527..0e442f0 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -229,12 +229,12 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.3"
+CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
-# CT_CC_V_4_4_6 is not set
+CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
-CT_CC_V_4_4_3=y
+# CT_CC_V_4_4_4_3 is not set
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
