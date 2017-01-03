From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Jan 2017 15:29:50 +0100
Subject: [Buildroot] [PATCH] libopenh264: bump to version 1.6.0
Message-ID: <20170103142950.19122-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of bugfixes, some of which may be security related:

http://www.openwall.com/lists/oss-security/2017/01/02/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 6d7c40b..2fc76ec 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 98077bd5d113c183ce02b678733b0cada2cf36750370579534c4d70f0b6c27b5  libopenh264-v1.5.0.tar.gz
+sha256 65d307bf312543ad6e98ec02abb7c27d8fd2c9740fd069d7249844612674a2c7  libopenh264-v1.6.0.tar.gz
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 6f1c7a6..40bbf80 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = v1.5.0
+LIBOPENH264_VERSION = v1.6.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2c
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.10.2
