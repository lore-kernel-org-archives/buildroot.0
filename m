From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:59:40 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/rtl8188eu: bump
 version to 0924dc8f
Message-ID: <20200828155322.4C0ED7FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de33015715a2767de013fb860516ea22a186235b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

- fixes compile against linux-5.4.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 854b98408ce927163057411fbe2abaf69198173a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
