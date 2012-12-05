From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed,  5 Dec 2012 20:41:59 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: bumpimg default GCC
	version to 4.6.3
In-Reply-To: <1354736519-18173-1-git-send-email-c.schoenert@t-online.de>
References: <1354736519-18173-1-git-send-email-c.schoenert@t-online.de>
Message-ID: <1354736519-18173-2-git-send-email-c.schoenert@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@t-online.de>

This bumps the GCC version from 4.4.6 to 4.6.3 to for
*.config-eglibc
*.config-glibc
*.config-uClibc
be equal to the default GCC setting in buildroot as well in addition to
commit b855154ee8683e87afa08c6cc50b716d22879922.

Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc |    2 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc  |    2 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 1b523ec..9ad1c5b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -265,7 +265,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 026c7fd..f220287 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -265,7 +265,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 8ad481f..cede4ad 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -264,7 +264,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
-- 
1.7.10.4
