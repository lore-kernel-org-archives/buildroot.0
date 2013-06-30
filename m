From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:05 +0200
Subject: [Buildroot] [PATCH 4/8] liburcu: define license
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/liburcu/liburcu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 35f09f7..7a32e7f 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,6 +7,8 @@
 LIBURCU_VERSION = 0.7.7
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
+LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
-- 
1.8.3.1
