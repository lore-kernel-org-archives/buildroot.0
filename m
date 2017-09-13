From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 20:45:44 +0200
Subject: [Buildroot] [PATCH 3/3] package/nvidia-driver: bump version to
	384.69
In-Reply-To: <20170913184544.5670-1-bernd.kuhls@t-online.de>
References: <20170913184544.5670-1-bernd.kuhls@t-online.de>
Message-ID: <20170913184544.5670-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 7fa729e77a..e05b8f04d5 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c39805e6610f710d16acf57c9d09cb5504d33c557e634e632079d46f18da4268  NVIDIA-Linux-x86-381.09.run
-sha256 04ec99f6d621adc464314adc82a92009e071a301a773487df7f460333e04e98c  NVIDIA-Linux-x86_64-381.09.run
+sha256 3b70587582220ab1102bcb8386f206f89e6b146856af41f16eaa5910e54ef8fd  NVIDIA-Linux-x86-384.69.run
+sha256 a7b7984fc532be17c262bc4353e279824ae63625d8ae9f1016cb66d199b97650  NVIDIA-Linux-x86_64-384.69.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 1795434811..e56661059f 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 381.09
+NVIDIA_DRIVER_VERSION = 384.69
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
-- 
2.11.0
