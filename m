From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:52:42 +0100
Subject: [Buildroot] [git commit] linux: bump CIP kernel 4.19 series
Message-ID: <20210326223002.5A8D18A265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c670ab1e6c5782ea80ec0f1be81ef482786d2b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 8 ++++----
 linux/linux.hash | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d8b2f6089c..d7bdf5e7d8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.11)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.152-cip37)"
+	bool "Latest CIP SLTS version (4.19.182-cip45)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.152-cip37-rt16)"
+	bool "Latest CIP RT SLTS version (4.19.165-cip41-rt18)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -126,8 +126,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.11.8" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 98616755ef..992ae22d11 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,8 +8,8 @@ sha256  b22e764095362d9e63d76375db838d9372474ba5cbe6132c9a8b07f7533f07ff  linux-
 sha256  7adc041af81424ff8d68affe3005fa9e5babc4e84e0b07e4effdf54225ba9426  linux-4.14.226.tar.xz
 sha256  05db750ba01ad557bef50835c253894fad9fb0db2224f0e803b25e2ff7ab2365  linux-4.19.182.tar.xz
 # Locally computed
-sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
-sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
+sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
+sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
