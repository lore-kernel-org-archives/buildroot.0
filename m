From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Nov 2017 21:06:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/ofono: Bump to version 1.21
Message-ID: <20171102200647.16501-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index ef955a9bb8..37933f126b 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5  ofono-1.20.tar.xz
+sha256 a6b021cda0b444b772897cd637d5f455857fb5819b62c279a8302b44f9c7f2c3  ofono-1.21.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 1aea2d40ae..b4b7915a30 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.20
+OFONO_VERSION = 1.21
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.14.2
