From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:07 +0200
Subject: [Buildroot] [PATCH 6/8] lttng-libust: define license
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-libust/lttng-libust.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 35d9eef..c3137aa 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,6 +7,8 @@
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
 LTTNG_LIBUST_VERSION = 2.2.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
+LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
+LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
-- 
1.8.3.1
