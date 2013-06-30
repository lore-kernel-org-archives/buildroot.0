From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:08 +0200
Subject: [Buildroot] [PATCH 7/8] lttng-modules: define license
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-modules/lttng-modules.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index a0f6c8f..66faa1f 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -7,6 +7,8 @@
 LTTNG_MODULES_VERSION = 2.2.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
+LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
+LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 
 LTTNG_MODULES_DEPENDENCIES = linux
 
-- 
1.8.3.1
