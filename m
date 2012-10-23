From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Oct 2012 10:18:11 -0300
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.14
In-Reply-To: <1350998291-31932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350998291-31932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350998291-31932-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 58f8d17..e039fd4 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.13
+LIBNL_VERSION = 3.2.14
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
1.7.8.6
