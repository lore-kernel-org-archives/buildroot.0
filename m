From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:09:04 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: bump version to
	358.16
Message-ID: <20151219131256.3128381DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a85673f0edb3ccaf064aad3bf09c119cde35cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for compatibility with X.org xserver >= 1.18:
http://www.nvidia.com/download/driverResults.aspx/95921/en-us
"Added support for X.Org xserver ABI 20 (xorg-server 1.18)."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 137590f..ba2f555 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bba63c30c730ad7b8500a77c81cae58562b9f9b57cd576b61f37a2d8bc45df25  NVIDIA-Linux-x86-346.35.run
-sha256  8625acbbc7a2abdda436a5cb9d06f2a7f5913b16e0a35ac4f9f106853a94d086  NVIDIA-Linux-x86_64-346.35.run
+sha256	d3a2842cbfb1163e20c658fbfaf5a235d5c9f035cd2d657f15df8a14b3fe80b1	NVIDIA-Linux-x86-358.16.run
+sha256	a942cdb29ed715ff1ce25beb06b6c2490126b98ef8bee5d9973967b557596bf2	NVIDIA-Linux-x86_64-358.16.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 4bcb65e..a021ab8 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 346.35
+NVIDIA_DRIVER_VERSION = 358.16
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
