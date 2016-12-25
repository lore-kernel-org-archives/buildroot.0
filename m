From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Dec 2016 18:56:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump version to 2.3.2
Message-ID: <20161225175637.851-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index f076e58ea..edbcd3fcc 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,4 +1,4 @@
-# From https://www.linuxtv.org/pipermail/vdr/2015-September/028872.html
-md5 391c2ed60e2f7d24563fe3ed5854bc4f  vdr-2.3.1.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2016-December/029178.html
+md5 6dbb208ea3d59658a18912b49af175b3  vdr-2.3.2.tar.bz2
 # Locally computed
-sha256 456d3f0ceb699b92ebeaf9ff4c0c68979724d10b01a89d5250133e6f4c262fa7  vdr-2.3.1.tar.bz2
+sha256 6c6ab08cf4dadd296e5e4a1c13f793c2e9222ec23103ae7aa9d616619f1496c0  vdr-2.3.2.tar.bz2
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 1894defb2..cdfa7e3af 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.3.1
+VDR_VERSION = 2.3.2
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
 VDR_LICENSE = GPLv2+
-- 
2.11.0
