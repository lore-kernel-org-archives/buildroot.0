From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 19:12:48 +0200
Subject: [Buildroot] [git commit] package/rtl8723bu: bump version to
 c9549d172a4f9d6ccf6d528682640246a41c2f0c
Message-ID: <20200502170049.E896B90D63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35841ffa532ea10a1bb7f09c03d23d36fba69b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index ef4eddaa63..0d06fff22b 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 da04cffc306d9738abdc67d234b8948db6ca97ed77760c68d99d18817839a513 rtl8723bu-b922079a090dcaad58179d478442ff97f18521c9.tar.gz
+sha256  19dae2b8b2c14b1f428c34ddb343fa41ddf9ae79bdefcb7c5baa65d357ca5a45  rtl8723bu-c9549d172a4f9d6ccf6d528682640246a41c2f0c.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 942b13bbf6..c54b2ef0da 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = b922079a090dcaad58179d478442ff97f18521c9
+RTL8723BU_VERSION = c9549d172a4f9d6ccf6d528682640246a41c2f0c
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
