From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  6 May 2013 08:22:29 +0100
Subject: [Buildroot] [PATCH] zeromq: bump version to 3.2.3
Message-ID: <1367824949-12544-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index ba585d9..bebba20 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZEROMQ_VERSION = 3.2.2
+ZEROMQ_VERSION = 3.2.3
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-- 
1.8.1.2
