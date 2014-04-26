From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 26 Apr 2014 09:41:48 +0100
Subject: [Buildroot] [PATCH] czmq: bump version to v2.2.0
Message-ID: <1398501708-7756-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/czmq/czmq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index db8f727..4703041 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = b5730c5f8290a611fd3b92e4a259c2b0ed96cb73
+CZMQ_VERSION = v2.2.0
 CZMQ_SITE = git://github.com/zeromq/czmq.git
 
 # Autoreconf required as we use the git tree
-- 
1.9.1
