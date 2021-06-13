From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 13 Jun 2021 19:19:21 +0300
Subject: [Buildroot] [PATCH 1/6] rtl8189fs: bump revision to 62c31d57
In-Reply-To: <20210613161926.2790763-1-geomatsi@gmail.com>
References: <20210613161926.2790763-1-geomatsi@gmail.com>
Message-ID: <20210613161926.2790763-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update out-of-tree driver to make it work with Linux kernel v5.12.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f1524a6fcc..f5279d2b2c 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f3f8bcc1e75f095350f12c36f7b8af88eebf3913d4bc921083489f1758cb5068 rtl8189fs-54bd6808e38f213126e7d6447ae9d80c656179f3.tar.gz
+sha256 7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c6	rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 39122bc786..4112b135ad 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 54bd6808e38f213126e7d6447ae9d80c656179f3
+RTL8189FS_VERSION = 62c31d577c385316bb99107f60e63169dacc37db
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.32.0
