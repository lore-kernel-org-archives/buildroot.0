From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 25 Feb 2021 16:33:41 +0100
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.12.0
Message-ID: <20210225153345.8061-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE OS package version to OP-TEE release 3.12.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 3076be6b42..8e833ecd75 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.11.0"
+	bool "3.12.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.11.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.12.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 0d60cebea1..36bc1d9593 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.11.0.tar.gz
-sha256 3c34eda1052fbb9ed36fcfdfaecfd2685023b9290670c1a5982f8a0457bfd2cb  optee-os-3.11.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.12.0/optee-os-3.12.0.tar.gz
+sha256 b13991099f25d00dac479db93b55034cb93d206e296f2c7aa9c42b92bca2c783  optee-os-3.12.0.tar.gz
 # Locally computed
 sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.17.1
