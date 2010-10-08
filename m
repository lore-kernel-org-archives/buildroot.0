From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri,  8 Oct 2010 08:55:08 +0200
Subject: [Buildroot] [PATCH 6/7] libtool: bump to 2.2.10
In-Reply-To: <1286520909-3436-1-git-send-email-llandwerlin@gmail.com>
References: <1286520909-3436-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1286520909-3436-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libtool/libtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index a996876..b57bca9 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,7 +3,7 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 1.5.24
+LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-- 
1.7.1
