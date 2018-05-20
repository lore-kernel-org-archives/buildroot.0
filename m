From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:30:02 +0200
Subject: [Buildroot] [git commit branch/next] libopenh264: bump to version
 1.7.0
Message-ID: <20180520102902.9E39A812E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71b54ba98b98b05b5bcad05a89db5ef6699b3a2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenh264/libopenh264.hash | 3 ++-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 2fc76ecc1a..b9cd9ed53e 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 65d307bf312543ad6e98ec02abb7c27d8fd2c9740fd069d7249844612674a2c7  libopenh264-v1.6.0.tar.gz
+sha256 9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f  libopenh264-v1.7.0.tar.gz
+sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index feead5b849..233e7971f4 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = v1.6.0
+LIBOPENH264_VERSION = v1.7.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
