From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:17:45 +0100
Subject: [Buildroot] [PATCH 2/4] lttng-modules: bump to 2.1.0
In-Reply-To: <cover.1356905589.git.s.martin49@gmail.com>
References: <cover.1356905589.git.s.martin49@gmail.com>
Message-ID: <848936cac6518fe04bbe31cd75545c0575d5195a.1356905589.git.s.martin49@gmail.com>
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
index a245b19..54ae864 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -3,7 +3,7 @@
 # LTTng-modules: the kernel modules (requires at least Linux 2.6.38)
 #
 #############################################################
-LTTNG_MODULES_VERSION = 2.0.3
+LTTNG_MODULES_VERSION = 2.1.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 
-- 
1.8.0.3
