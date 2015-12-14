From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:22 -0300
Subject: [Buildroot] [PATCH 43/45] lttng-libust: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-44-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index cfd2367..40354ac 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,7 +7,7 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.7.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
+LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT for system headers, GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-- 
2.4.10
