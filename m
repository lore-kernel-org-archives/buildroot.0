From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:45:02 +0200
Subject: [Buildroot] [git commit] package/rtl8188eu: bump version, add hash
Message-ID: <20160607214727.C6B3981DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05eb2e24e27e4b7bd068d904f85e7b9e7349bba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 ++
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
new file mode 100644
index 0000000..6f68f44
--- /dev/null
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9f16fab009bd7bc9e377cf7dcdf82be1b60e7f88e27f2833eea5b422d104e3fe rtl8188eu-ced2b64a1139dcaf86947e3a9f7617dffbd64239.tar.gz
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index d1034c4..5da6bf3 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 3091828c8f4b4a01cbec6025128bf77e6e7b9f97
+RTL8188EU_VERSION = ced2b64a1139dcaf86947e3a9f7617dffbd64239
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
