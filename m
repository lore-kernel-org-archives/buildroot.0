From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 14:02:01 -0300
Subject: [Buildroot] [PATCH] readline: make description more enlightening
	and fix indentation
Message-ID: <1375290121-23373-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/readline/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 305955a..fbebf18 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -2,4 +2,6 @@ config BR2_PACKAGE_READLINE
 	bool "readline"
 	select BR2_PACKAGE_NCURSES
 	help
-	    Enable GNU readline support?
+	  The GNU Readline library provides a set of functions for use
+	  by applications that allow users to edit command lines
+	  as they are typed in.
-- 
1.8.1.5
