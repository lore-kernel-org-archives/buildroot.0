From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:30:49 +0100
Subject: [Buildroot] [git commit] package/rtl8188eu: Bump to 60cb0b5
 (v5.2.2.4 branch HEAD)
Message-ID: <20201221091743.E933C8812E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39da908f01cccca6fc9ddb23e7bc428021a6de1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to build against newer kernels (up to 5.10).
Added support for new HW (Edimax EW-7811Un V2, RTL8188FU, MERCUSYS
MW150US v2, various RTL8188CE)

Tested on kernel v5.9.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index b16986176d..37767f5d16 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24656123468506760974edf4a9087f6c77d13228fa6b6ce899c12c359a5dc1e7  rtl8188eu-0924dc8fe0845358ed5b3c4c673126069469b3fc.tar.gz
+sha256  b2b06c842bccd730d68a26b1c1b5a24f18373401e907147bf5e775fa42a36bbb  rtl8188eu-60cb0b5a3cfc95e3f2e6fc294a28d987096b0559.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 686b2ea9d2..b2066080f3 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 0924dc8fe0845358ed5b3c4c673126069469b3fc
+RTL8188EU_VERSION = 60cb0b5a3cfc95e3f2e6fc294a28d987096b0559
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
