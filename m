From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Mar 2014 15:38:28 +0100
Subject: [Buildroot] [PATCH v2 3/6] lttng-modules: bump version to 2.4.0
In-Reply-To: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
References: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394289511-10524-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
---
 package/lttng-modules/lttng-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index baa421e..ca51e87 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.2.0
+LTTNG_MODULES_VERSION = 2.4.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
-- 
1.9.0
