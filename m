From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:09 +0200
Subject: [Buildroot] [PATCH v4 10/22] linux: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-11-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 linux/linux.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index f165dda..bd3e23e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -4,6 +4,8 @@
 #
 ###############################################################################
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_LICENSE = GPLv2
+LINUX_LICENSE_FILES = COPYING
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
-- 
1.7.9.5
