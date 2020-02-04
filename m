From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  4 Feb 2020 23:37:43 +0100
Subject: [Buildroot] [PATCH] linux: bump CIP RT kernel to version
 4.19.98-cip19-rt7
Message-ID: <1580855863-25362-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Linux CIP RT version to 4.19.98-cip19-rt7.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cb914f2..00871a5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -49,7 +49,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.90-cip16-rt6)"
+	bool "Latest CIP RT SLTS version (4.19.98-cip19-rt7)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -130,7 +130,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 3fb7361..510f69c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,5 +7,5 @@ sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4
 sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
 # Locally computed
 sha256 18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
-sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
+sha256 7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
 sha256 ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
-- 
2.7.4
