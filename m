From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 19:04:59 +0100
Subject: [Buildroot] [git commit] rtl8189fs: bump to newer revision
 supporting Linux 4.14
Message-ID: <20171208181255.8346B815E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7918f1b042d8f0f6f7fdbf5315752a266f102550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index aa844cd..abb18bf 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 50ca09d97b22001184231b746d7133e500d3e3998a23a8ea5c3b4da72c4f72c0 rtl8189fs-04b44d437b20f28ba83fcaecc0bdab7f7647fd11.tar.gz
+sha256 949392828269164a206702fbb5a53b71487cb8602e3979373233569d80dea7e7 rtl8189fs-e0e80a9805472df943ad159b12633881aa69374a.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index d7add51..681c75f 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 04b44d437b20f28ba83fcaecc0bdab7f7647fd11
+RTL8189FS_VERSION = e0e80a9805472df943ad159b12633881aa69374a
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
