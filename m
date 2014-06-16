From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:32 -0300
Subject: [Buildroot] [PATCH 2/6] tslib: switch homepage now that berlios is
	gone
In-Reply-To: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402926636-3556-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tslib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index ef03f90..ee70807 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TSLIB
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
-	  http://tslib.berlios.de/
+	  https://github.com/kergoth/tslib
 
 comment "tslib needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
-- 
1.8.5.5
