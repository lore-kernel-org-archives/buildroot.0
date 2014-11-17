From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Nov 2014 21:15:35 +0100
Subject: [Buildroot] [PATCH] python-tornado: add zlib run-time dependency
Message-ID: <1416255335-4335-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index c127d0e..870a3de 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
-- 
1.8.3.2
