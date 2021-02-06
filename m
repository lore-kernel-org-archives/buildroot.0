From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sat,  6 Feb 2021 22:33:59 +0800
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 7.3.2
Message-ID: <20210206143359.9365-1-zhaojh329@gmail.com>
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
index baae45ed4e..283a5d1da5 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  38bf042421c3d5e1ff862a64bd299d4b8b1e193faf4e56f8f8beb55e88cb7924  rtty-7.3.1.tar.gz
+sha256  4c60eacd7a653988a1907284de2ecf360c74f55ef9e21c40b9ebd87af6570908  rtty-7.3.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 343daef53c..dc91445287 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.3.1
+RTTY_VERSION = 7.3.2
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-- 
2.25.1
