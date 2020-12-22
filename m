From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:15:22 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/ti-sgx-*: fix
 s/correpsonds/corresponds/ typo
Message-ID: <20201222140146.F003181F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=137338d27b9758687e1824d9aa3751b942591cfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 292475976f20df8c105aa3af1854f582ab0bbab5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-sgx-demos/ti-sgx-demos.mk | 2 +-
 package/ti-sgx-km/ti-sgx-km.mk       | 2 +-
 package/ti-sgx-um/ti-sgx-um.mk       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
index ea6c6c6b08..4baebb9be5 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.mk
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.00.00.07 plus one pull request
+# This corresponds to SDK 06.00.00.07 plus one pull request
 TI_SGX_DEMOS_VERSION = bb8b74cdd1323e76697b3eb2258f863b15fee287
 TI_SGX_DEMOS_SITE = http://git.ti.com/git/graphics/img-pvr-sdk.git
 TI_SGX_DEMOS_SITE_METHOD = git
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index ae294c300a..d5fd3b470e 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.00.00.07
+# This corresponds to SDK 06.00.00.07
 TI_SGX_KM_VERSION = 4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d
 TI_SGX_KM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_SITE_METHOD = git
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index 0e26d057c1..bf7d225633 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.00.00.07 plus one pull request
+# This corresponds to SDK 06.00.00.07 plus one pull request
 TI_SGX_UM_VERSION = 2a2e5bb090ced870d73ed4edbc54793e952cc6d8
 TI_SGX_UM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_SITE_METHOD = git
