From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 May 2019 22:12:51 +0200
Subject: [Buildroot] [PATCH v1] package/libopenh264: bump version to v1.8.0
Message-ID: <20190509201251.8266-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index b9cd9ed53e..f8a63f523e 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f  libopenh264-v1.7.0.tar.gz
+sha256 08670017fd0bb36594f14197f60bebea27b895511251c7c64df6cd33fc667d34  libopenh264-v1.8.0.tar.gz
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 233e7971f4..96979a9d43 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBOPENH264_VERSION = v1.7.0
+LIBOPENH264_VERSION = v1.8.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
--
2.21.0
