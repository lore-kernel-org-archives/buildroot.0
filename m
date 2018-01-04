From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu,  4 Jan 2018 21:36:27 +0300
Subject: [Buildroot] [PATCH 1/2] rtl8189fs: bump revision to 569bdb91
In-Reply-To: <20180104183628.3913-1-geomatsi@gmail.com>
References: <20180104183628.3913-1-geomatsi@gmail.com>
Message-ID: <20180104183628.3913-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Out-of-tree driver has been updated according to timer API changes
in the upcoming Linux v4.15.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index abb18bf2ad..d6ce6c1e8a 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 949392828269164a206702fbb5a53b71487cb8602e3979373233569d80dea7e7 rtl8189fs-e0e80a9805472df943ad159b12633881aa69374a.tar.gz
+sha256 93472471e1769f92984792f40a0898dd8dd02122d745d48e8edd1a8cc869bc82 rtl8189fs-569bdb91f2cc76e2f5b77df42471db2a62fd2376.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 681c75f8ac..d463bba7e6 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = e0e80a9805472df943ad159b12633881aa69374a
+RTL8189FS_VERSION = 569bdb91f2cc76e2f5b77df42471db2a62fd2376
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.11.0
