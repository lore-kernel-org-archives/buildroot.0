From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 Dec 2020 23:27:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/rtl8188eu: bump to b02c92b
 (v5.2.2.4 branch HEAD)
Message-ID: <20201209222751.76980-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to build against latest kernel (v5.10-rc7),
adds more hardware support.

Tested on kernel v5.9.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index b16986176d..5028cbdfe4 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24656123468506760974edf4a9087f6c77d13228fa6b6ce899c12c359a5dc1e7  rtl8188eu-0924dc8fe0845358ed5b3c4c673126069469b3fc.tar.gz
+sha256  e855e210b27fc33212c558d34c32e0a5ccc32209d5c7e3f71fcf67695c224594  rtl8188eu-b02c92bc92e22fd8b51c9acd6d602637cfce7256.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 686b2ea9d2..97e5d858e8 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 0924dc8fe0845358ed5b3c4c673126069469b3fc
+RTL8188EU_VERSION = b02c92bc92e22fd8b51c9acd6d602637cfce7256
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.28.0
