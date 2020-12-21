From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 11:02:33 +0100
Subject: [Buildroot] [git commit] package/ti-sgx-*: fix
 s/correpsonds/corresponds/ typo
Message-ID: <20201221094621.4AFF787EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=292475976f20df8c105aa3af1854f582ab0bbab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 25f1f83ca7..8ca6dbde2c 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.01.00.08
+# This corresponds to SDK 06.01.00.08
 TI_SGX_KM_VERSION = cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9
 TI_SGX_KM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_SITE_METHOD = git
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index 30d1ef81f0..83dbc6804c 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.01.00.08
+# This corresponds to SDK 06.01.00.08
 TI_SGX_UM_VERSION = 909e237baf47d0bde006ff25552f5403fd7e359d
 TI_SGX_UM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_SITE_METHOD = git
