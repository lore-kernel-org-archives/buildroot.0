From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:44:18 +0200
Subject: [Buildroot] [git commit] rtl8821au: bump to 4c298b
Message-ID: <20160501124517.97F3881819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14bef025ec440ccbe332d442c659e1ab3afb20b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes numerous stablity and cleanup passes by ulli-kroll.

A hash file is also added, as it was missing before.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8821au/rtl8821au.hash | 2 ++
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
new file mode 100644
index 0000000..2e3c56c
--- /dev/null
+++ b/package/rtl8821au/rtl8821au.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 26e1a72b553a044ec34b57d9264ae7616c008a598a9009faba51331b55285a5b  rtl8821au-4c298b160253a7efa507c8ecdb868d1579ad02a7.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index eddb18e..58a91da 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = fef8c9d67d076eee9dfb9e19cb7cb69815d5a207
+RTL8821AU_VERSION = 4c298b160253a7efa507c8ecdb868d1579ad02a7
 RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
 RTL8821AU_LICENSE_FILES = COPYING
