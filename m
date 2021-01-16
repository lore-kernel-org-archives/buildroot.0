From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:09:23 +0100
Subject: [Buildroot] [git commit] package/rtl8723du: bump to version
 9ce1c38439f4f574bb7adaf33949835c25536a28
Message-ID: <20210116215027.1E16783549@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=785fd823674b8e49fb068320b9322d059167a8d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix builds with kernel 5.10

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 0d06fff22b..04bc776a07 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  19dae2b8b2c14b1f428c34ddb343fa41ddf9ae79bdefcb7c5baa65d357ca5a45  rtl8723bu-c9549d172a4f9d6ccf6d528682640246a41c2f0c.tar.gz
+sha256  4c7314dccebda1e55ec8dcf0d5ca8915c2490d17a9f56923f25e6e0e945c10cc  rtl8723bu-9ce1c38439f4f574bb7adaf33949835c25536a28.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index c54b2ef0da..c35fad5832 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = c9549d172a4f9d6ccf6d528682640246a41c2f0c
+RTL8723BU_VERSION = 9ce1c38439f4f574bb7adaf33949835c25536a28
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
