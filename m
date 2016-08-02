From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 2 Aug 2016 22:23:26 +0530
Subject: [Buildroot] [PATCH 1/1] readline: add project URL
Message-ID: <1470156806-20400-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/readline/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index fbebf18..1cb0672 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_READLINE
 	  The GNU Readline library provides a set of functions for use
 	  by applications that allow users to edit command lines
 	  as they are typed in.
+
+	  https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
-- 
2.6.2
