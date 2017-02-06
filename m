From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 09:00:08 -0500
Subject: [Buildroot] [PATCH 1/5] linux-firmware: bump to version
	6d3bc8886517d171068fd1263176b8b5c51df204
Message-ID: <20170206140012.1029-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/linux-firmware.hash | 2 ++
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/linux-firmware/linux-firmware.hash

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
new file mode 100644
index 0000000..e8ee2b7
--- /dev/null
+++ b/package/linux-firmware/linux-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 256378564e36b8f222adb8fbe746529e73413c6cbe2b0e5574f41dfd62d92577 linux-firmware-6d3bc8886517d171068fd1263176b8b5c51df204.tar.gz
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 51e07b5..7706bd5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = a179db97914da5e650c21ba8f9b0bae04a0f8a41
+LINUX_FIRMWARE_VERSION = 6d3bc8886517d171068fd1263176b8b5c51df204
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.9.3
