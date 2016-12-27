From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 18:01:39 +0100
Subject: [Buildroot] [git commit] package/vdr: bump version to 2.3.2
Message-ID: <20161227170146.C7AE681952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25662d9d81cab62e2b294dbe76804c379c576c4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index f076e58..edbcd3f 100644
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
index 1894def..cdfa7e3 100644
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
