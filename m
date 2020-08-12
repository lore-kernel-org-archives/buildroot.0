From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 Aug 2020 22:18:46 +0200
Subject: [Buildroot] [PATCH v1] package/rtl8188eu: bump version to 0924dc8f
Message-ID: <20200812201846.17416-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fixes compile against linux-5.4.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 88c128aa35..b16986176d 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc872aa0991c044d35abfcc81543bad950c6aae487e37d5a09d1cbf8c4cb3058  rtl8188eu-4b0ecca485b9f11f58670b69aa9f90ecad7da02f.tar.gz
+sha256  24656123468506760974edf4a9087f6c77d13228fa6b6ce899c12c359a5dc1e7  rtl8188eu-0924dc8fe0845358ed5b3c4c673126069469b3fc.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index f292bba134..686b2ea9d2 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 4b0ecca485b9f11f58670b69aa9f90ecad7da02f
+RTL8188EU_VERSION = 0924dc8fe0845358ed5b3c4c673126069469b3fc
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.28.0
