From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Wed, 27 Jan 2021 22:02:09 +0800
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 7.2.3
Message-ID: <20210127140209.72954-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/rtty/rtty.hash | 2 +-
 package/rtty/rtty.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index 176bae0995..f4fef5243f 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  10675a12f4333d5b552b6489f04ca4be8821bb67c1fcfca7b002ed7a7fe498c7  rtty-7.2.1.tar.gz
+sha256  067a2e0df9abb6d4419271ce6ecc47435824bc82205ad75bbf166e4259a7f9e2  rtty-7.2.3.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 7fbd7c06b6..a78375297f 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.2.1
+RTTY_VERSION = 7.2.3
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-- 
2.25.1
