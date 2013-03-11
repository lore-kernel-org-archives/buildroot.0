From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 11 Mar 2013 13:43:09 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump version to 3.2.2
Message-ID: <1363002189-8109-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 284a168..2d0026d 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZEROMQ_VERSION = 2.2.0
+ZEROMQ_VERSION = 3.2.2
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-- 
1.8.0.1
