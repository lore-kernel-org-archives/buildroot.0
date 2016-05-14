From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 14 May 2016 23:09:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/android-tools: fix indentation in
	Config.in.host
In-Reply-To: <1463260156-23406-1-git-send-email-s.martin49@gmail.com>
References: <1463260156-23406-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1463260156-23406-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/android-tools/Config.in.host | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 1c3a519..4326014 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -1,26 +1,26 @@
 config BR2_PACKAGE_HOST_ANDROID_TOOLS
-       bool "host android-tools"
-       select BR2_PACKAGE_ANDROID_TOOLS_ADB if \
-              !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
-       help
-         This package contains the fastboot and adb utilities, that
-         can be used to interact with target devices using of these
-         protocols.
+	bool "host android-tools"
+	select BR2_PACKAGE_ANDROID_TOOLS_ADB if \
+		!BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
+	help
+	  This package contains the fastboot and adb utilities, that
+	  can be used to interact with target devices using of these
+	  protocols.
 
 if BR2_PACKAGE_HOST_ANDROID_TOOLS
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
-       bool "fastboot"
-       help
-         This option will build and install the fastboot utility for
-         the host, which can be used to reflash target devices
-         implementing the fastboot protocol.
+	bool "fastboot"
+	help
+	  This option will build and install the fastboot utility for
+	  the host, which can be used to reflash target devices
+	  implementing the fastboot protocol.
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
-       bool "adb"
-       help
-         This option will build and install the adb utility for the
-         host, which can be used to interact with target devices
-         implementing the ADB protocol.
+	bool "adb"
+	help
+	  This option will build and install the adb utility for the
+	  host, which can be used to interact with target devices
+	  implementing the ADB protocol.
 
 endif
-- 
2.8.2
