From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:51:17 +0200
Subject: [Buildroot] [git commit] rtl8189fs: bump revision to 62c31d57
Message-ID: <20210713192708.B17E89557A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b88a0a57a9a590427d03719777c46f7ea5a6c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update out-of-tree driver to make it work with Linux kernel v5.12.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f1524a6fcc..ef040763a7 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f3f8bcc1e75f095350f12c36f7b8af88eebf3913d4bc921083489f1758cb5068 rtl8189fs-54bd6808e38f213126e7d6447ae9d80c656179f3.tar.gz
+sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
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
 
