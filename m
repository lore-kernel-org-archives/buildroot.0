From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:11:36 +0100
Subject: [Buildroot] [git commit] libuci: bump version
Message-ID: <20170325141449.8A27082189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ca80b3cf2cefb30f0d9a7c8fdd3f3d34086440a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change upstream location

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 6647045..9161be9 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
-LIBUCI_SITE = git://nbd.name/uci.git
+LIBUCI_VERSION = 49ec6efbdac4819033d34f08927d795f83a3932d
+LIBUCI_SITE = git://git.openwrt.org/project/uci.git
 LIBUCI_LICENSE = LGPLv2.1, GPLv2 (tools)
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
