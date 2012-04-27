From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Apr 2012 07:30:32 -0300
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.8
In-Reply-To: <1335522632-12572-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335522632-12572-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335522632-12572-2-git-send-email-gustavo@zacarias.com.ar>
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
index 661d7f2..40aaf38 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.7
+LIBNL_VERSION = 3.2.8
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
-- 
1.7.3.4
