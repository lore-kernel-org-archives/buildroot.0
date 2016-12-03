From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 12:58:05 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/nvidia-driver: bump version to
	375.20
Message-ID: <20161203115809.25297-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://www.nvidia.com/download/driverResults.aspx/111596/en-us
"Added support for X.Org xserver ABI 23 (xorg-server 1.19)"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 9427ffb..04a44b8 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38cb22fa85ef74ea960d3e5d644838cd961984ffc32bb0d052414cc7fa32e315  NVIDIA-Linux-x86-367.35.run
-sha256  d2df3fcb1a145984b9de4f2f38a90e353469e9d12279cf5e2c67c553b112d075  NVIDIA-Linux-x86_64-367.35.run
+sha256 cc79d3ac2b688009ed2e47a1cf27557aea5dd745b3b6e9b83945c359ddab4335  NVIDIA-Linux-x86-375.20.run
+sha256 d10e40a19dc57ac958567a2b247c2b113e5f1e4186ad48e9a58e70a46d07620b  NVIDIA-Linux-x86_64-375.20.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 36f6e13..cb9b7fa 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 367.35
+NVIDIA_DRIVER_VERSION = 375.20
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
-- 
2.10.2
