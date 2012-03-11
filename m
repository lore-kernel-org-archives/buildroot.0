From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:47:58 -0300
Subject: [Buildroot] [PATCH 09/20] libnl: bump to version 3.2.7
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index fc37c7d..661d7f2 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.4
-LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
-LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
+LIBNL_VERSION = 3.2.7
+LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
 LIBNL_MAKE = $(MAKE1)
-- 
1.7.3.4
