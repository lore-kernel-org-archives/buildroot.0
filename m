From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:02 -0300
Subject: [Buildroot] [PATCH 04/14] libnl: bump to version 3.2.16
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-4-git-send-email-gustavo@zacarias.com.ar>
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
index e039fd4..9bf680e 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.14
+LIBNL_VERSION = 3.2.16
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
1.7.8.6
