From: Christian Stewart <christian@paral.in>
Date: Thu,  9 Jan 2020 21:00:16 -0800
Subject: [Buildroot] [PATCH 1/1] rtl8821au: bump to 2020.01 commit hash
Message-ID: <20200110050016.1924705-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumps rtl8821au to the 2020.01 master commit hash:

  fa68771376a637c0b5f9cfa53da008570939a259

https://github.com/abperiasamy/rtl8812AU_8821AU_linux

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index f35d57910c..503a8866d7 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 23889fe4bf518dbadcbfac613f64a74bbce177267d9337a98843e4e7de8f1896  rtl8821au-b018b446fb0729fa659e7eead475d6c13f192642.tar.gz
+sha256  ac5a7c4f25509f754d0d386185940a21758544b0d25b9fc760154c468f6767cf  rtl8821au-fa68771376a637c0b5f9cfa53da008570939a259.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index b6ad431b8b..c3f0d9192a 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = b018b446fb0729fa659e7eead475d6c13f192642
+RTL8821AU_VERSION = fa68771376a637c0b5f9cfa53da008570939a259
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.24.1
