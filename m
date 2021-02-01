From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Mon,  1 Feb 2021 21:14:26 +0800
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 7.3.1
Message-ID: <20210201131426.3038-1-zhaojh329@gmail.com>
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
index a60bbd8b7e..baae45ed4e 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  b0037d6af9f52fdc843b3463eefd52a40a091560d6a33e1abb3bb02fe68d349b  rtty-7.3.0.tar.gz
+sha256  38bf042421c3d5e1ff862a64bd299d4b8b1e193faf4e56f8f8beb55e88cb7924  rtty-7.3.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 7fc0803239..343daef53c 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.3.0
+RTTY_VERSION = 7.3.1
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-- 
2.25.1
