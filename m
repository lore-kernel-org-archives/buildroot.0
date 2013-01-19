From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 12:03:47 +0100
Subject: [Buildroot] [PATCH 3/4] lttng-libust: bump to version 2.1.1
In-Reply-To: <cover.1358593210.git.s.martin49@gmail.com>
References: <cover.1358593210.git.s.martin49@gmail.com>
Message-ID: <26be851b0e776f7f6f969962d9b571498b30c127.1358593210.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e1f51b1..e143118 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.1.0
+LTTNG_LIBUST_VERSION = 2.1.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-- 
1.8.1.1
