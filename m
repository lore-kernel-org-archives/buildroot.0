From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Nov 2019 17:55:55 +0300
Subject: [Buildroot] [PATCH 2/9] rtl8189fs: bump revision to 54bd6808
In-Reply-To: <20191103145602.1332350-1-geomatsi@gmail.com>
References: <20191103145602.1332350-1-geomatsi@gmail.com>
Message-ID: <20191103145602.1332350-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Out-of-tree driver has been updated to work with Linux kernels v5.x.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index d6ce6c1e8a..f1524a6fcc 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 93472471e1769f92984792f40a0898dd8dd02122d745d48e8edd1a8cc869bc82 rtl8189fs-569bdb91f2cc76e2f5b77df42471db2a62fd2376.tar.gz
+sha256 f3f8bcc1e75f095350f12c36f7b8af88eebf3913d4bc921083489f1758cb5068 rtl8189fs-54bd6808e38f213126e7d6447ae9d80c656179f3.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index d463bba7e6..39122bc786 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 569bdb91f2cc76e2f5b77df42471db2a62fd2376
+RTL8189FS_VERSION = 54bd6808e38f213126e7d6447ae9d80c656179f3
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.23.0
