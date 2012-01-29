From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:39 +0100
Subject: [Buildroot] [RFC 06/15] linux: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 linux/linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5c5a1d2..cb481b1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -4,6 +4,7 @@
 #
 ###############################################################################
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_LICENSE = GPL_V2_ONLY
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
-- 
1.7.5.4
