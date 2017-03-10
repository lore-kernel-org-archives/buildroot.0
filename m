From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Mar 2017 10:54:43 +0200
Subject: [Buildroot] [PATCH 1/2] libnl: update homepage link
Message-ID: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old link is broken. Use the github repo instead.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 46877c37a263..1e29f5740088 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBNL
 	help
 	  A library for applications dealing with netlink socket.
 
-	  http://people.suug.ch/~tgr/libnl/
+	  https://github.com/thom311/libnl
 
 if BR2_PACKAGE_LIBNL
 
-- 
2.11.0
