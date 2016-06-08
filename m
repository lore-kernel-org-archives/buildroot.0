From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 07:55:30 +0200
Subject: [Buildroot] [git commit] package/rtl8821au: bump version
Message-ID: <20160608055536.7E6F07FD44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=945ef10e4a9e71d811cee913d32aacdcf381a555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 2e3c56c..cac4ce2 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 26e1a72b553a044ec34b57d9264ae7616c008a598a9009faba51331b55285a5b  rtl8821au-4c298b160253a7efa507c8ecdb868d1579ad02a7.tar.gz
+sha256 64d068b92215f06f877629b2e6cd5da41329ac1222104ff9dc7ec504ca23af09  rtl8821au-116a3abe7783b023655e9917afe2d1eabe178028.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 58a91da..cf8f4cd 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 4c298b160253a7efa507c8ecdb868d1579ad02a7
+RTL8821AU_VERSION = 116a3abe7783b023655e9917afe2d1eabe178028
 RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
 RTL8821AU_LICENSE_FILES = COPYING
