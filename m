From: Jaap Crezee <jaap@jcz.nl>
Date: Fri, 21 Nov 2014 17:36:31 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
Message-ID: <1416587791-30125-1-git-send-email-jaap@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/bluez5_utils/bluez5_utils.hash | 3 +++
 package/bluez5_utils/bluez5_utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/bluez5_utils/bluez5_utils.hash

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
new file mode 100644
index 0000000..9166f7e
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -0,0 +1,3 @@
+# No upstream hashes for the following:
+sha1    8f65a7076d83116cfacbb84374b99269cd15f1d6                            bluez-5.25.tar.xz
+sha256  5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30    bluez-5.25.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index f34513c..21f792c 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.21
+BLUEZ5_UTILS_VERSION = 5.25
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.1.3
