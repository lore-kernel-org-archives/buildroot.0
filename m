From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:00:26 +0100
Subject: [Buildroot] [git commit] bluez5_utils: bump to version 5.25
Message-ID: <20141207230236.5F5D77FEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3848823e8dd1c9f17935533e91c8e0fbb2f0bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: tweak commit log.]

Signed-off-by: Jaap Crezee <jaap@jcz.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/bluez5_utils.hash |    2 ++
 package/bluez5_utils/bluez5_utils.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
new file mode 100644
index 0000000..664072f
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
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
