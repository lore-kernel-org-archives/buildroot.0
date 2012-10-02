From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Oct 2012 14:40:50 -0300
Subject: [Buildroot] [PATCH 3/5] iproute2: bump to version 3.6.0
In-Reply-To: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349199652-12928-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 90588a3..62328ab 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.5.1
+IPROUTE2_VERSION = 3.6.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 IPROUTE2_LICENSE = GPLv2
-- 
1.7.8.6
