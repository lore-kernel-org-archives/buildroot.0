From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 16:11:49 -0700
Subject: [Buildroot] [PATCH/next 1/2] package/libnftnl: bump version to 1.1.6
Message-ID: <20200507231150.2092627-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libnftnl/libnftnl.hash | 4 ++--
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 4d2eb0ef08..0114619089 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256	66de4d05227c0a1a731c369b193010d18a05b1185c2735211e0ecf658eeb14f3	libnftnl-1.1.5.tar.bz2
-sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
+sha256  c1eb5a696fc1d4b3b412770586017bc01af93da3ddd25233d34a62979dee1eca  libnftnl-1.1.6.tar.bz2
+sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index ac780bd8d3..f624474196 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.5
+LIBNFTNL_VERSION = 1.1.6
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.26.2
