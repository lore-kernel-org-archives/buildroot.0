From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Jun 2017 17:52:31 -0300
Subject: [Buildroot] [PATCH 1/2] linux-firmware: Bump to the latest version
Message-ID: <1497646352-3328-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to commit ec58d9aaf3.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 1646039..9b8dfed 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1cd14477a392fe8c7c44e62623b85466df90ed72a55ae213b637e1c4335739fd linux-firmware-6d3bc8886517d171068fd1263176b8b5c51df204.tar.gz
+sha256 ec58d9aaf3cf80f768c32ba22d925c0542436ef3ee4588acd3e49b12ca2ed9d9 linux-firmware-a3a26af24e29c818ef9b5661856018e21a5c49fb.tar.gz
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2611941..65b9a73 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 6d3bc8886517d171068fd1263176b8b5c51df204
+LINUX_FIRMWARE_VERSION = a3a26af24e29c818ef9b5661856018e21a5c49fb
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.7.4
