From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:36 -0300
Subject: [Buildroot] [PATCH 6/6] can-utils: switch homepage now that berlios
	is gone
In-Reply-To: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402926636-3556-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately the gitorious page/wiki says nothing useful so use the
elinux.org page for now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/can-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index d5d4297..307f069 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_CAN_UTILS
 	  networking stack.
 	  This package provides various tools for this stack.
 
-	  http://developer.berlios.de/projects/socketcan/
+	  http://elinux.org/Can-utils
-- 
1.8.5.5
