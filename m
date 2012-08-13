From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:39 -0300
Subject: [Buildroot] [PATCH 5/7] iproute2: bump to version 3.5.0
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 27bc56f..c671e44 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.4.0
+IPROUTE2_VERSION = 3.5.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+IPROUTE2_LICENSE = GPLv2
+IPROUTE2_LICENSE_FILES = COPYING
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
-- 
1.7.8.6
