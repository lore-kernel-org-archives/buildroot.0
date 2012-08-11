From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:17 -0400
Subject: [Buildroot] [PATCH 07/17] libdaemon: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-7-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libdaemon/libdaemon.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 1bdc1e2..214402a 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -6,6 +6,8 @@
 
 LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
+LIBDAEMON_LICENSE = LGPLv2.1+
+LIBDAEMON_LICENSE_FILES = LICENSE
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
-- 
1.7.9.5
