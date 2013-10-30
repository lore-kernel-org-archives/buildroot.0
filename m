From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:20:11 +0200
Subject: [Buildroot] [PATCH 4/5] lttng-libust: bump to version 2.3.0
In-Reply-To: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1383164412-20657-4-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b0ebd3f..14e2852 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.2.0
+LTTNG_LIBUST_VERSION = 2.3.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
1.8.3.2
