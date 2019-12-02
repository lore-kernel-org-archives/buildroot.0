From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:49 -0000
Subject: [Buildroot] [git commit] package/rtl8189fs: bump revision to
 54bd6808
Message-ID: <20191202083931.B564E80FFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0efe2e15a95a7399a34d7182eabc9d074cf6c667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Out-of-tree driver has been updated to work with Linux kernels v5.x.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Tested-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
