From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jul 2020 08:02:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to 2.1.1
Message-ID: <20200726060253.207946-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://github.com/cisco/openh264/blob/openh264v2.1.1/RELEASES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 349299158e..0689ab961f 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  27f185d478066bad0c8837f4554cd8d69cca1d55d5f3dc6a43a8cef1fe6c005f  libopenh264-2.1.0.tar.gz
+sha256  af173e90fce65f80722fa894e1af0d6b07572292e76de7b65273df4c0a8be678  libopenh264-2.1.1.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 07196e3dd5..5a1000a6d8 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.1.0
+LIBOPENH264_VERSION = 2.1.1
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.27.0
