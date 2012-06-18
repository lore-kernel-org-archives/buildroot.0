From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 10:23:12 +0200
Subject: [Buildroot] [PATCH] pthread-stubs: fix incorrect indentation
Message-ID: <1340007792-7548-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/pthread-stubs/Config.in |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/pthread-stubs/Config.in b/package/x11r7/pthread-stubs/Config.in
index de13e87..c17f7da 100644
--- a/package/x11r7/pthread-stubs/Config.in
+++ b/package/x11r7/pthread-stubs/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PTHREAD_STUBS
 	bool "pthread-stubs"
 	help
-		This library provides weak aliases for pthread functions not
-		provided in libc or otherwise available by default.
-
-		http://xcb.freedesktop.org/
+	  This library provides weak aliases for pthread functions not
+	  provided in libc or otherwise available by default.
 
+	  http://xcb.freedesktop.org/
-- 
1.7.9.5
