From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:03 +0200
Subject: [Buildroot] [PATCH 2/8] lttng-modules: bump version to 2.2.0
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-modules/lttng-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 85ccaf3..a0f6c8f 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.1.2
+LTTNG_MODULES_VERSION = 2.2.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 
-- 
1.8.3.1
