From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Nov 2017 22:07:35 -0200
Subject: [Buildroot] [PATCH] linux-firmware: Bump to the latest version
Message-ID: <1511741255-9710-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to commit 17e6288135d4.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 9b8dfed..209ea26 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ec58d9aaf3cf80f768c32ba22d925c0542436ef3ee4588acd3e49b12ca2ed9d9 linux-firmware-a3a26af24e29c818ef9b5661856018e21a5c49fb.tar.gz
+sha256 28d359523a36c1cdc3e85a8e148bb2d68b036d28b10f0e80a192f3dc29f02c16 linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b.tar.gz
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d238abe..fd0fa3d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = a3a26af24e29c818ef9b5661856018e21a5c49fb
+LINUX_FIRMWARE_VERSION = 17e6288135d4500f9fe60224dce2b46d850c346b
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.7.4
