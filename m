From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 24 Mar 2017 18:19:52 +0530
Subject: [Buildroot] [PATCH 3/6] libuci: bump version
In-Reply-To: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1490359795-18362-3-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change upstream location

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
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
-- 
2.6.2
