From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:55:58 +0200
Subject: [Buildroot] [PATCH 2/5] package/rtl8188eu: bump version, add hash
In-Reply-To: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465163761-2848-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtl8188eu/rtl8188eu.hash | 2 ++
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8188eu/rtl8188eu.hash

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
-- 
2.8.1
